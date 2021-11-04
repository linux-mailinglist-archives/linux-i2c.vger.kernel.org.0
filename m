Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E46A444FEB
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Nov 2021 09:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhKDIJR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Nov 2021 04:09:17 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:31949 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhKDIJR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Nov 2021 04:09:17 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211104080637epoutp03543f50bf9e9eb0f4dd6e220382c1545c~0SVXeqNG52956729567epoutp03b
        for <linux-i2c@vger.kernel.org>; Thu,  4 Nov 2021 08:06:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211104080637epoutp03543f50bf9e9eb0f4dd6e220382c1545c~0SVXeqNG52956729567epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636013197;
        bh=qa/yzENbdpESw+Mno6H3EK3K6BEa4R6OD6RhKOMusLA=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=AEBY6xEXC+GjroMdaNLedFrpw7KIcoi0f2Toa+idFXwqouoXnllEa4sQxWmLBqsXX
         RfQdcf9EGLoOHS23Cy9IgOOf4OfrzkiFfevwHTtcgEXTXTvW6V0EiOMv7u/rCtOBWR
         x4LEHNfqvNA45YBRbmf+INpssZhiroMUGPfmrQ2Y=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211104080637epcas2p2cca4486885e1d0608d6df461bbc3df4f~0SVXAG4Wh2014220142epcas2p2O;
        Thu,  4 Nov 2021 08:06:37 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HlGS32Rhmz4x9QJ; Thu,  4 Nov
        2021 08:06:27 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        31.3D.10014.08493816; Thu,  4 Nov 2021 17:06:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211104080623epcas2p4f952cd027035a60cf83ec5b9ba73eecf~0SVKfJf3X0860108601epcas2p4N;
        Thu,  4 Nov 2021 08:06:23 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211104080623epsmtrp16763d4939bc8b92efbe71f7f972235b5~0SVKeMyDF3195431954epsmtrp1j;
        Thu,  4 Nov 2021 08:06:23 +0000 (GMT)
X-AuditID: b6c32a47-473ff7000000271e-43-61839480a765
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        AD.79.08738.F7493816; Thu,  4 Nov 2021 17:06:24 +0900 (KST)
Received: from KORCO006858 (unknown [10.229.8.71]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211104080623epsmtip2fbb6b5787fc5469638b711a1e2aff99c~0SVKRbXZ11933119331epsmtip2R;
        Thu,  4 Nov 2021 08:06:23 +0000 (GMT)
From:   "Jaewon Kim" <jaewon02.kim@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Chanho Park'" <chanho61.park@samsung.com>,
        <linux-i2c@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <c626abd9-eebb-3111-123d-7b2bea95b310@canonical.com>
Subject: RE: [PATCH 2/2] dt-bindings: i2c: exynos5: add exynos-usi-hsi2c
 compatible
Date:   Thu, 4 Nov 2021 17:06:23 +0900
Message-ID: <000f01d7d152$dbdd8410$93988c30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGADPushVHyCl5/LZIyge1c8Sk7cAFDRVn/ASU+KdQBxreuHqyBETMw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEJsWRmVeSWpSXmKPExsWy7bCmhW7DlOZEgzkf2S0u79e22Pj2B5NF
        x98vjBaXd81hs5hxfh+TReveI+wWd/fPZXRg95jV0MvmsWlVJ5tH35ZVjB6fN8kFsERl22Sk
        JqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAHaCkUJaYUwoU
        CkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM548LKb
        vWC+WMXlW19YGxjXC3YxcnJICJhIPJp0i62LkYtDSGAHo8TzFxNYIZxPjBK7258zQzifGSXO
        n5nGDNNyvnU3VMsuRokfayewgSSEBJ4zStyeow5iswnoSuzc+IodpEhEoItR4tKXHWAdzAJT
        GSVu3OgCG8Up4Cix7uhmRhBbWCBUoufOInYQm0VAReL30QusIDavgKXEydkXmCBsQYmTM5+w
        gNjMAvIS29/OgTpJQeLn02Vg9SICbhInHzxmh6gRkZjd2Qb2g4RAL4fE9zezGSEaXCR+zLkO
        1Sws8er4FnYIW0riZX8bkM0BZNdLfL3hANHbwyixpusXE0SNvcSv6VtYQWqYBTQl1u/ShyhX
        ljhyC+o0PomOw3+hpvBKdLQJQTSqSdyfeo4NwpaRmHRkJdMERqVZSB6bheSxWUgemIWwawEj
        yypGsdSC4tz01GKjAmN4bCfn525iBCdOLfcdjDPeftA7xMjEwXiIUYKDWUmE9/mGpkQh3pTE
        yqrUovz4otKc1OJDjKbAoJ7ILCWanA9M3Xkl8YYmlgYmZmaG5kamBuZK4ryWotmJQgLpiSWp
        2ampBalFMH1MHJxSDUxMW9eLyCkm8s58Yd544OzXxL15wmd/iv0xKdB/7zN7skzWPB7lu3lH
        NP0mzrh6i8c/uuxJzfFTsv+KTlxumZ7dVWv62MNgSjNvSe2KbeHpSvaVHIUbKtsXsu436OTI
        e1Ap+s324ILDLcqP2fmvnD5wgO2L17fNxiq/BZ0mO6dzh89KVXktp7/vZ/wNpqXzr+7JUnju
        s3Zh9hK/D+4PZrE8+DGj/bS5vqba8Xkx0/6JP9SaWHi6ZG+vUc/+STUq0XVVlyJ/nZvFKu1u
        nOK7SjokRE36yI68uD8mevbZEysEftZXvFp7/0rv2xcNjJ/FmL15o/prRXtLZ3WwHtusweGi
        +/L0NI0ZC9eqxuauyVJiKc5INNRiLipOBADWj6aWJQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvG7DlOZEg5+9jBaX92tbbHz7g8mi
        4+8XIG/XHDaLGef3MVm07j3CbnF3/1xGB3aPWQ29bB6bVnWyefRtWcXo8XmTXABLFJdNSmpO
        Zllqkb5dAlfGg5fd7AXzxSou3/rC2sC4XrCLkZNDQsBE4nzrbrYuRi4OIYEdjBLXF3xggkjI
        SCx/1scGYQtL3G85wgpR9BSo6MQidpAEm4CuxM6Nr8BsEYEeRolzPUIgRcwC0xklFq5uZIHo
        +MYoMWfnfBaQKk4BR4l1RzczgtjCAsESP+4eArNZBFQkfh+9wApi8wpYSpycfYEJwhaUODnz
        CVgvs4C2RO/DVkYIW15i+9s5zBDnKUj8fLqMFeIKN4mTDx6zQ9SISMzubGOewCg8C8moWUhG
        zUIyahaSlgWMLKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYLjSEtrB+OeVR/0DjEy
        cTAeYpTgYFYS4X2+oSlRiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalF
        MFkmDk6pBiYtiUVBLoKinqGx/8SyPnznvbS06V/fojY/fk/NGdcXOp1db78l7tO0qwxmEvPu
        TLfcXjv9itGpK5Fp95xYA6O0Zk0yt3BfM23j2VkNf/07RBx0C7f2Kr9fYuPlunPz5Pzti6Y8
        mtRkI7S5dVvsWc358woWy6z9ECgnzze//aaM9EVGzwkv027c4r5ervP7hmOFRMO779zvvK/N
        fKD35GZW/V29xRUpe03qBRp6S/k8z562nSfkbbBzrkWplIzdFXP7aIf5i5Q2JHDZXDY7d3WX
        5dqVx7o/Xd22cVNF7eTPTsvPhG/8Nv/vnss/LSQ1wrgW792gMe9u6Iyfj7tbFFOWd3+x1Jh6
        eVKgiITk3aj1SizFGYmGWsxFxYkAGsC/iBIDAAA=
X-CMS-MailID: 20211104080623epcas2p4f952cd027035a60cf83ec5b9ba73eecf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101114158epcas2p46b50f8d946d59ffaedd203370b81c6ed
References: <20211101113819.50651-1-jaewon02.kim@samsung.com>
        <CGME20211101114158epcas2p46b50f8d946d59ffaedd203370b81c6ed@epcas2p4.samsung.com>
        <20211101113819.50651-2-jaewon02.kim@samsung.com>
        <c626abd9-eebb-3111-123d-7b2bea95b310@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Krzysztof

> On 01/11/2021 12:38, Jaewon Kim wrote:
> > This patch adds new "samsung,exynos-usi-hsi2c" compatible.
> > It is for i2c compatible with HSI2C available on Exynos SoC with USI.
> >
> > Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> 
> The bindings go as first patch, please.

Okay, I will change patch order in next.

> 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> > b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> > index 2dbc0b62daa6..ce2373c7a357 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
> > @@ -14,6 +14,8 @@ Required properties:
> >  				on Exynos5260 SoCs.
> >  	-> "samsung,exynos7-hsi2c", for i2c compatible with HSI2C available
> >  				on Exynos7 SoCs.
> > +	-> "samsung,exynos-usi-hsi2c", for i2c compatible with HSI2C available
> > +				on Exynos SoCs with USI.
> 
> I would prefer to describe the Exynos model, not the feature. USI might change between different SoCs,
> so then it will be "usiv2"?
> 

Okay, I will use Exynos model instaed of feature name.
"samsung,exynosautov9-hsi2c"

> >
> >    - reg: physical base address of the controller and length of memory mapped
> >      region.
> > @@ -31,6 +33,8 @@ Optional properties:
> >         at 100khz.
> >      -> If specified, the bus operates in high-speed mode only if the
> >         clock-frequency is >= 1Mhz.
> > +  - samsung,usi-sysreg : sysreg handle to control USI type.
> > +    -> sysreg phandle for "samsung,exynos-usi-hsic" compatible.
> 
> s/sysreg/system registers controller/
> s/handle/phandle/
> 

Okay, I will change it.

> Please document to what is this phandle. To which block.
> 

Okay, I will add below description in next patch.

When using Exynos USI Block, it needs to select which type of Serial IPs(UART, SPI, I2C) to use with
system control register. So, it requires system register control and needs offset value of system register.

> Why it cannot be the existing generic samsung,sysreg?
> 

It is generic samsung,sysreg not for speical system register for USI.
I will change property name to "samsung,sysreg".

> >
> >  Example:
> >
> > @@ -46,6 +50,8 @@ hsi2c@12ca0000 {
> >  	#address-cells = <1>;
> >  	#size-cells = <0>;
> >
> > +	samsung,usi-sysreg = <&usi_sysreg 0x28>;
> 
> This does not look correct for this compatible. We should really convert the bindings to YAML...
> 

I will remove this property example.

> > +
> >  	s2mps11_pmic@66 {
> >  		compatible = "samsung,s2mps11-pmic";
> >  		reg = <0x66>;
> >
> 
> 
> Best regards,
> Krzysztof

Thanks
Jaewon Kim

