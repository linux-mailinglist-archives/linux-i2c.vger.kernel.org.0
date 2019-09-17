Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDC80B5108
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 17:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbfIQPHp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 11:07:45 -0400
Received: from mout.web.de ([212.227.15.3]:59779 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729011AbfIQPHp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Sep 2019 11:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568732860;
        bh=9nkGNOo/KpXHV2YblbVOWFzKHiHBVa4lZQAp4v0VDUs=;
        h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
        b=BmRuGOPfTtnJtOqH4ZBOJRS38/86q5SDI4E6yADduvDfON0hM8v0IJDdAPkVgWlVY
         UfKVIQBpDaallqwuNk++EP26XlgYeu1LTIQ6XdsguCUPD9Kcxi5yKobcN0BeRNRUOL
         kJ5UkLaz7NEgcQMbFIqHlgAi4qaObHMCS7/frmq8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.93.51]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LiCXL-1hosTn0iOp-00nQX8; Tue, 17
 Sep 2019 17:07:40 +0200
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190916185738.GA14035@SD>
Subject: Re: [1/3] i2c: qup: remove explicit conversion to boolean
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b5f63a71-6f6f-eea5-2283-6b5df22b267a@web.de>
Date:   Tue, 17 Sep 2019 17:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916185738.GA14035@SD>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Iiu9r1Bx3VzZaKzVwy0Ru2zadSTLvVnru3gv+4JduUCjetA7ysE
 +WpxizUi0Kp3e2HpGQ0OEE9DwFDNO4FAJszSNUdpJf7HAL01C/o856cSpHe37W16GX864Dt
 UIZSEsDMGe1k1zk0uwu3qBsTygxI2VmdPn3akXTdDHJz1G+9p1GpwM9a1of2x6DkorsK/5+
 1k2H1DRVUzjJq3Aw7UsVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W28F4qYcXQ0=:wmsexZirT2sH1Ixo3VejM/
 dhikDHgq04/nNDoxQJJFjwuaDOyf8zNSz4UBl4h538OC75c1PImlw/xmaIxL+XM5AwGKrfFZG
 pxTpSpYBx2wdg2WId2gPySUP1WCnYG2So5II9sK8XKlQPsOr9cdRpyKvcjDeU+Fe+K+8avkf4
 w8X7FjAwfIiiyCp8UVXc+R4i5a5nAUiSOKdL99m6lamj3md3UUd5m3U8D5u5fpyrk2at4B6pE
 0/yOLMG98nVwnnQuRcjrhLCRX+Wrhtpbs10MbuC42qk0zBLpddB3cx6HYu8PrZWIk2OM2xoCT
 sUF7CVOIHMwSbCvfMRV5gntpbwzg2fS5B7DnTtWIN9eunYdRBPdFWmdYInJSRStb465CbvFhR
 3SaNjFK2bfWfZBFZpqdK9sZ7n0ObIbNU31yH+zpxopjoN18bkYGkJnbQY6PuXijWxTsnqKid/
 Aad6Nk4lHCkjIHpe1ogQ9anroGnsu2VsLBINrd+CKQZl8uiH6Xro51akMaSZ8KsVGSPidf4vh
 e+2ExWTvVxLkCMrm275QuiwRX8cmJv/WMyXg4Dxzwdwi8Mu6T/jIhLHsdIQ7g8RrTQzNXjqK7
 9cmGXM2yszv6HwnbvzBKOyKW2hjjcVujuIOZpJxPggIcc4PlSWdFBob9ujXBytF6zSKKQ6ogn
 FI5l8BEuPdicXSvGrcY0S4hXU6yIR8yeWL7dDB6njxE8pNFcwWMGfwK/9D0RFvdYmOfTQ4+O7
 hsuWIBkiOSRaqypBV+tFgDkDs8lKub7368suJrCQ1ree2TXoCxsmIbe3fZdHDBHcb7kBSpz2w
 RfaHXC/6cIIT7ABsdIvWSdE2Xeb03HIFWFKgy6i3z2uC7x6WbVXokhqMbFGg5nsASPkA+ni5Y
 wyHil0a71V3OCaBk62QU/ZFj6YkXSPVqUaFYCWQzlltfUYuQtCdfCRxd8/RecGXGXR3r+XuRu
 Ubs2swdpSyCynr9+6ElYMOD6Jewhkk0tJkujsY+RbcVrNImENHLh4b2J1er54RxM9/ZW0m7/2
 AmRj03mwUHCFMFARcxtMFmcc4C2eB6eDuphLiayvydfurM/BcEKlgKb+ReopL+2dGKvgk3IQi
 q8g3Tn5VwU/2qG6oxwEgMaUUXzBE6Mg4AWdzwpUEB6PZqoQBHaQ3zTyuPo3Cwpb0KhUVuCweP
 RTVFE3YtWh2jK6m8ZO7Hml3gsXzGUX946CuLFe2T1h/AO0Eo33e0amG6jj9kaq3yf5wJv2QeF
 6IOgdSkSQEisJumF4uTvq9M7GxuoJKpBz3P4+jTrnXaOCaOf19zmZF7rq0bA=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Found using - Coccinelle (http://coccinelle.lip6.fr)

Can a tag like =E2=80=9CGenerated by: scripts/coccinelle/misc/boolconv.coc=
ci=E2=80=9D
be more helpful for this change description?

Regards,
Markus
