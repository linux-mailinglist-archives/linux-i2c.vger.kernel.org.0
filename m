Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635F92843A5
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 03:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJFBKZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 21:10:25 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:41393 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgJFBKX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 21:10:23 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201006011017epoutp0296e01a9602596620fa94cb505b1f2ccc~7QfYIgmPy1813818138epoutp02j;
        Tue,  6 Oct 2020 01:10:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201006011017epoutp0296e01a9602596620fa94cb505b1f2ccc~7QfYIgmPy1813818138epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601946617;
        bh=B4PawtUJM2t4wzU2pvIySnG7we9Bhgj1khiFTd9d9CE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Rx8RJtC6Yj3KjGbngnY3QrOD1xUh97k2CcjP1L4bTfTZIPheVmtqSJrA4EZdpPPOg
         trAwp0No0N/0erQYIZqHeGT1O8Y1jJ5bsPfmRbRjm0h8DI5JF5XlW5/vhGg3S/8m9/
         spUfOkBMrCNoisTG2YOcZI8q4vf8cCSD1/9SF9L8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20201006011016epcas1p459c312e10a907b7832b22cd23eb9d8a4~7QfXew6HM1279312793epcas1p4Q;
        Tue,  6 Oct 2020 01:10:16 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.154]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4C4zsY6sg8zMqYks; Tue,  6 Oct
        2020 01:10:09 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        20.E2.09577.1F3CB7F5; Tue,  6 Oct 2020 10:10:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20201006011008epcas1p300f9dc6918a008b4b0acf5870f438a2e~7QfP7yysc1939819398epcas1p3e;
        Tue,  6 Oct 2020 01:10:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201006011008epsmtrp151af87c3414c2b6b37057fcba7d215f2~7QfP5fMXI0584005840epsmtrp1N;
        Tue,  6 Oct 2020 01:10:08 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-24-5f7bc3f11c68
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C1.AB.08604.0F3CB7F5; Tue,  6 Oct 2020 10:10:08 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201006011007epsmtip14dca797b06e6c0e4525f28d6ead67ad0~7QfO-JeoX3017730177epsmtip1d;
        Tue,  6 Oct 2020 01:10:07 +0000 (GMT)
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <0e155728-89b3-5f31-f008-dfd57b6c4f6b@samsung.com>
Date:   Tue, 6 Oct 2020 10:23:28 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01UaVBTVxSe+/KWoFKfiOXCVIHYOtUqEhF66KB1lNpXdapVy1hnbIzwBhhD
        kknAqnQYQMCouFBcSkRgCC5sChGQTVBWaQtBUEQxrmhAFgUEXKA2EJzy7zvnfOd8850z9woF
        NiahgzBQHsyr5FKZiJ5CFlTOd13UVxkqcU0cXQxpN28zYDBWCCD/vZaBTONRGtIiA+DE43Ya
        kgZmQ6IhioTkqgYKMk+MUlCZ2oHg1uBLGvbpLtGQ+vJPCiLSmkl4FJlBgMGQw0BjwREK0uKT
        KTgQl8bAw8FqBEO3NAQcHzlPgP5pCwUZwycE0Bf7gILLySMI9nflI9CMvkZQU/iEgKSqXhLu
        9g9R0FycSEN+90UEsTn55nl6M6/qw1EEJZHnGKhPqqVh4HAVAqMxA0HBQBQNNZm3aPhHd5iB
        iL67DKSeixZA68UyBvJLrxFQlFhHwTn9CAGV+8souJR6nIS2iAs0dDbHCiBGOx2Mf1XT8L64
        hoH4om4EH0oLGWh/fISGC2/N2v+25JLwd0kwxNTUUCvWcNFN50kuKSuU6+7sJLm89LsEV6l5
        zXBFWiPDpehDuL6mNsSd1iRQnK60k+Ca60M4fcYBmgu/ZiC5+y2lNNfb0MBw6VlZ1AbHrTu9
        AnipH69y4uW+Cr9Auf8y0dpNklUSdw9X8SKxJ3wtcpJLg/hlIu91GxatDpSZjypy2iWVhZhT
        G6RqtWjxci+VIiSYdwpQqIOXiXiln0zpqXRRS4PUIXJ/F19F0DdiV9cl7mbi9p0ByRffEUo9
        uTun+yYVjuoFB5GVELNLcVfXfXQQTRHasIUIv0h5QlqCfoTr4zIoSzCEcElkA/mx5VR1FmMp
        XEW4sT9lgvUS4aL2B+Osmex2bBpqGxexZbfh2nsvxucK2DRbXN0WO16g2QW4vKOVHsPTWWd8
        +81TNIat2eX48tk3xBgm2c+x4W3r+NBZrA+uK4ia4MzAdQnt5rxQaMV64Lz0eWNpAWuH77Un
        ExbsiK/0JArGdDHbPBV3HHuGLBa8cd/pjokNzMQvavMYC3bAnUdjJnAoTq+roi3NGoTzyhsp
        S8ENl5+NJ8aEBex8fKl4sSXtjIven0EW4U9w72AsNUbBrDXWxNhYKHNx8yMjYcH2WLf/AH0M
        ibST3GgnWdBOsqD9XywFkRnoU16pDvLn1WKl++Rz69H4i1/gWYhO9bxyqUCEEFUgLBSIbK1d
        fHZLbKz9pHv28iqFRBUi49UVyN283ziBwyxfhfnLkAdLxO5L3NzcYKnYw10sFtlZP77nJLFh
        /aXB/E6eV/Kqj32E0MohnHC0Cr9uN/qLx0oUL2mqWLHQ3SDbfHL1g0SvGblX91k3eLY8jFtZ
        aveqKbs/bsuhz5yPcyafMvsuU3h7j1PY2sK2nxqmrTuUlOzhoBs2Zuderc5N7bmxRRs2tzg1
        TNMTuGezH/fFwqJ5I4p5Pnsdt//2+/36gNqN+iub1iR8f2rY7dcdmWr7Q93DP288Mnvrm/gz
        LlFLTaFZTL1uTuY227gn30WXZWWv831rMgavcpL/WCZ7fmdtxNMv7da3vtt1Q/dtzvU5lVKP
        P2a8HqgxmbxadPLn630Hs4fnS21brSN/uFBSVb4jgV7p/FXjM+81u+0ls+x8o1dPvbk3qCTs
        pKDj8p3erdPsMsNHRaQ6QCpeIFCppf8BncC7Z3oFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxiA851rgRCOBcIB41SGmBHBsTD2uhlisjkO0yWbm2RbdNiMBlBA
        RmFDWTJA5CaXOQWh0pZLASlYoFCkgIC0sMCklYsExDoRzEDuooCCshayhH9P3u95vvfPy8P5
        BsqJFxIeJYwMF4Q6U5ZEvdb5Hfd5bWzA+2MaR5D33qfBYGzHQb0qpqHCmEWBPCEYskfHKZAu
        7oB8QyIBMp2ehIrsNyRoiyYQDLyco+BCcRUFRXO5JMTL+wl4nKDAwGCopuFefSYJ8isyElIv
        y2n452UHgqWBFAyurpVhoBobJEGxnI3DQvojEmplawiSp9QIUt68QNDZ8AQDqW6WgOHnSyT0
        N+ZToJ5WIkivVpv+U5k83XoWgqaEUhp6pH9RsJihQ2A0KhDULyZS0FkxQMHd4gwa4heGaSgq
        vYjDkLKFBnVzGwaa/C4SSlVrGGiTW0ioKrpKwEj8DQom+9NxSBLbgLG7g4LVxk4armimEaw3
        N9AwPppJwY1Xpt1vB2sI+LspCpI6O8lDX3AX+8oITloZy01PThJcXfkwxmlTXtCcRmykuQJV
        NLfQN4K46yl5JFfcPIlx/T3RnEqRSnFxbQaCezjYTHGzej3NlVdWkl/t/MHyYKAwNOQXYeR+
        n1OWwTLlayxCRcRUT/eScagHT0MWPJbxYq91VNJm5jNNiJXmO2/OHdmc3g6TwzOxLavVitKQ
        pUmZQezsQvJGa8ucYv9dGtlw7JiTbMZzS7ODM0o7dqxRT24GasSup0k2FlCMG9s6MUSZ2YbZ
        zd5fGUNmtmZ82NqSFczMBOPCGl4NEWa2Z/xZjXwM23S2sV1544R5mQXjzdaVu5rHOLOXXZP2
        4ZvswD4Yl2GbvJO9NZOP/4FsxVtq8ZZEvCURb0kKEKFAjsIIUVhQmMgzwjNc+KuHSBAmig4P
        8vjpbJgKbdy823sN6JZi3qMdYTzUjlge7mxn7eEfE8C3DhScOy+MPBsQGR0qFLWj7TzC2cF6
        6OfCH/lMkCBKeEYojBBG/v+K8Syc4jCL2x+7enjndd+V7Tp/WP9g38D3kuNtCwUdvMRrOcQ9
        7yn+apJ0wD1G6dLm0i3ZI7F4NhZ3wr/s8Sxhm9r95aef+HgNn9Me8AtE/GFdpo9VwtShE3d6
        JaV43TbdrmLXiQ+qVlMnjX57vEvOnFzLfrKvde/DY+OF64Xhjwb+DP399NGYcu60+Gn3bnuh
        Plrqq3E1hF5qIattpkZHu5JKahwor5zrTPqz166tB46VyY+UH92vr/1opWbHN1a+ys7j2tIs
        q7J5z88Lb4a4bf+u6UO/b8uXvUSWt2fm7hysh9y3n03nGn0dpxoEgQFPL1WnXoiVHL7p9C64
        X7a30fymDsxaFjW2fO1MiIIFnm54pEjwH6+El7RiBAAA
X-CMS-MailID: 20201006011008epcas1p300f9dc6918a008b4b0acf5870f438a2e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201005183933epcas1p36d2c9cc1f3ad9180421269ca74330d65
References: <20201005183830.486085-1-robh@kernel.org>
        <CGME20201005183933epcas1p36d2c9cc1f3ad9180421269ca74330d65@epcas1p3.samsung.com>
        <20201005183830.486085-5-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/6/20 3:38 AM, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
(snip)

>  Documentation/devicetree/bindings/extcon/wlf,arizona.yaml    | 2 ++
(snip)

For the extcon part,
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
