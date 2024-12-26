import UIKit

final class DetailsViewController: UIViewController {
    
    private let contentView = DetailsContentView()
    let viewModel = DetailsViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelectedMovie()
        setupBackButton()
    }
    
    private func setupSelectedMovie() {
        contentView.setDetails(movieTitle: "Людина павук",
                               imageUrl: "https://parmanews.ru/wp-content/uploads/2021/12/1920x-e1639442173584-696x790.jpg",
                               country: "Америка", year: "2004",
                               genre: "Детектив",
                               trailerUrl: nil,
                               rating: "10.0",
                               description: "Дуже великий текст який не є основним і це лише мок текст який я пишу дуже багато щоб зрозуміти як буде виглядати ЮаЙ для опису фільму і як він буде виглядати якщо буде багато тексту. Дуже великий текст який не є основним і це лише мок текст який я пишу дуже багато щоб зрозуміти як буде виглядати ЮаЙ для опису фільму і як він буде виглядати якщо буде багато тексту. Дуже великий текст який не є основним і це лише мок текст який я пишу дуже багато щоб зрозуміти як буде виглядати ЮаЙ для опису фільму і як він буде виглядати якщо буде багато тексту. Дуже великий текст який не є основним і це лише мок текст який я пишу дуже багато щоб зрозуміти як буде виглядати ЮаЙ для опису фільму і як він буде виглядати якщо буде багато тексту. Дуже великий текст який не є основним і це лише мок текст який я пишу дуже багато щоб зрозуміти як буде виглядати ЮаЙ для опису фільму і як він буде виглядати якщо буде багато тексту. Дуже великий текст який не є основним і це лише мок текст який я пишу дуже багато щоб зрозуміти як буде виглядати ЮаЙ для опису фільму і як він буде виглядати якщо буде багато тексту. Дуже великий текст який не є основним і це лише мок текст який я пишу дуже багато щоб зрозуміти як буде виглядати ЮаЙ для опису фільму і як він буде виглядати якщо буде багато тексту.")
    }
    
    private func setupBackButton() {
        contentView.setupBackButton { [weak self] in
            guard let self = self else { return }
            viewModel.goBackToMain()
        }
    }
}

@available(iOS 17, *)
#Preview {
    let view = DetailsViewController()
    return view
}
