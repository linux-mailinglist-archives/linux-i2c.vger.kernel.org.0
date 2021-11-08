Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB455447ECA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 12:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239204AbhKHLZO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 06:25:14 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:29518 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239200AbhKHLZN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 06:25:13 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211108112228epoutp0222c4dfc24edf5e97b14dd2f653c8db67~1jlf731sy0982409824epoutp02K
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 11:22:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211108112228epoutp0222c4dfc24edf5e97b14dd2f653c8db67~1jlf731sy0982409824epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636370548;
        bh=QvmD6Tmq+bJeo76I1IXC5kiKoG3gf1RUxDtEOlrq1nE=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=sEha9i6KURaOiSdljVhOOwh+4Gvak611b8A8YzJXQs+aolqT8EWlqO39CT/3rZdmA
         3T60YupF8LPXHrh5e0ht6eAHGxDT+GAqyBMZ5lmZ363GC6iNWnBgLPxR5rkzA2yRnA
         cgUt5z7QYYjsZp0Zto3rxtrreQPmpmAcXX9fTPxk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211108112227epcas2p380483e73cd6786665f9b466738270008~1jlfpRJV71337813378epcas2p3H;
        Mon,  8 Nov 2021 11:22:27 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.89]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Hnpc923XQz4x9Q2; Mon,  8 Nov
        2021 11:22:17 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        65.74.10018.76809816; Mon,  8 Nov 2021 20:22:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211108112214epcas2p2c58d675ceddb6e7cc5f478fd5c295bfc~1jlTFFmU90032300323epcas2p2B;
        Mon,  8 Nov 2021 11:22:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211108112214epsmtrp220678073f441bcf57c2906d42530a366~1jlTBClof0548405484epsmtrp2d;
        Mon,  8 Nov 2021 11:22:14 +0000 (GMT)
X-AuditID: b6c32a46-a0fff70000002722-a3-6189086702b4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A7.40.29871.66809816; Mon,  8 Nov 2021 20:22:14 +0900 (KST)
Received: from KORCO006858 (unknown [10.229.8.71]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211108112214epsmtip14e0ee3c318ecdbb6d831bae0b047c2c9~1jlS0RvFh0874508745epsmtip1H;
        Mon,  8 Nov 2021 11:22:14 +0000 (GMT)
From:   "Jaewon Kim" <jaewon02.kim@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Chanho Park'" <chanho61.park@samsung.com>,
        <linux-i2c@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <5b05ff2e-953c-d1a3-8347-4d3f9911cc49@canonical.com>
Subject: RE: [PATCH 1/2] i2c: exynos5: support USI(Universal Serial
 Interface)
Date:   Mon, 8 Nov 2021 20:22:14 +0900
Message-ID: <000401d7d492$e157a450$a406ecf0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH9TS3Ubwx9WhvNqO8Onnoqn/bWugGADPusApYBWVkB1joeOQEO3tdOq3aqCqA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplk+LIzCtJLcpLzFFi42LZdljTXDedozPRYEk3q8Xl/doWG9/+YLLo
        +PuF0eLyrjlsFjPO72OyaN17hN3i7v65jA7sHrMaetk8Nq3qZPPo27KK0ePzJrkAlqhsm4zU
        xJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygA5QUyhJzSoFC
        AYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RlTf/9g
        KTjDVfFlygnWBsZVHF2MnBwSAiYS69beZu5i5OIQEtjBKLH5xld2COcTo8Tt/XNYQaqEBL4x
        SvzYndrFyAHW0bhUC6JmL6PEm8XH2CCc54wSB7qWMIM0sAnoSuzc+ApskohAF6PEpS87wKqY
        BaYySty40cUMMopTwFGi800IiCksECDxa4UHiMkioCLxs5EPZAyvgKXEtoNnGCFsQYmTM5+w
        gNjMAvIS29/OYYb4QEHi59NlYHeKCPhJTDj+mhWiRkRidmcb2GcSAhM5JJZ0rGSDeMBF4vtb
        RYheYYlXx7ewQ9hSEp/f7YUqqZf4esMBorWHUWJN1y8miBp7iV/Tt7CC1DALaEqs36UPUa4s
        ceQW1GV8Eh2H/7JDhHklOtqEIBrVJO5PPccGYctITDqykmkCo9IsJH/NQvLXLCT3z0LYtYCR
        ZRWjWGpBcW56arFRgRE8opPzczcxgtOlltsOxilvP+gdYmTiYDzEKMHBrCTCe+9oR6IQb0pi
        ZVVqUX58UWlOavEhRlNgQE9klhJNzgcm7LySeEMTSwMTMzNDcyNTA3MlcV5L0exEIYH0xJLU
        7NTUgtQimD4mDk6pBqYc+Z43KRJ8Mg/6X9879XHW1/mX5OIFJ/Yvb7a1uzlNYtuKni+W4p/E
        0xRbZCvP6R/sE92zz+xAivvupOgzCSdPr27Zv9JE+fhkO8lV4i3vP7IZVcR8vnP2X+lm+bBz
        ou/Cv7h+S1sTMS1wZ//mO7yCXAIVHqbmy68yivQ+ymKxOjCxjY0nVWmh3ZEDUz9u4FHSnXqq
        f6rFt0Bd07z078U9KzbOnGH++Pu583p3TCV1k19/mCCouoUh9yqn0YUXGidVL6S7XNZJKmXl
        7VV/0j6peXbikrM7jXId8v9b7HhwvqQ2vU11A3eFRLvA2eCHE+9ZHq2Z8/g438abmy/mT5bj
        WfeRsX1e4NJZ37eZtrkqsRRnJBpqMRcVJwIACh4WXCAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsWy7bCSnG4aR2eiwYvVXBaX92tbbHz7g8mi
        4+8XRovLu+awWcw4v4/JonXvEXaLu/vnMjqwe8xq6GXz2LSqk82jb8sqRo/Pm+QCWKK4bFJS
        czLLUov07RK4Mqb+/sFScIar4suUE6wNjKs4uhg5OCQETCQal2p1MXJxCAnsZpT4sHUjUxcj
        J1BcRmL5sz42CFtY4n7LEVaIoqeMEmdOTGYFSbAJ6Ers3PiKHcQWEehhlDjXIwRSxCwwnVFi
        4epGFoiO5UwS/1b3sIKs4xRwlOh8EwLSICzgJ7FncQMbSJhFQEXiZyMfSJhXwFJi28EzjBC2
        oMTJmU9YQGxmAW2J3oetjBC2vMT2t3OYIY5TkPj5dBkrxA1+EhOOv2aFqBGRmN3ZxjyBUXgW
        klGzkIyahWTULCQtCxhZVjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBEeQluYOxu2r
        PugdYmTiYDzEKMHBrCTCe+9oR6IQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1Kz
        U1MLUotgskwcnFINTKdeHROMXtWhMuMD66RHFrH7jNv3FMQtWKnu7lORuNBJ70QDyyz3uos5
        HlXW9pwLAi55LdIqvb6X+fenRd0fl/yIN6nTlGxM/dGwK/jgyvPmvg17LcO36ddOendYZ28d
        g4wlk1x0u3RC2vpv/bZPH+heDAhYIF3v2iK4OHn7/dPiLw+LVGipxtU0X5LJPiQYVrZhQ9tP
        S1vT0jkOs97az11k1LphWvOhImVhHyaFuvUC9/tO392xlPfCkVnHfsx+06BwbwLjFPmnjTcY
        7Ju4wvpm9D05Kr5Qz4tTyyH82LvIXeW31EOzYsRvCejeeLpNUEZMZzmfls5WNxNOF55zi49u
        XvjNJr/o3fOQ893FSizFGYmGWsxFxYkAYWUsOA8DAAA=
X-CMS-MailID: 20211108112214epcas2p2c58d675ceddb6e7cc5f478fd5c295bfc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5
References: <CGME20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5@epcas2p1.samsung.com>
        <20211101113819.50651-1-jaewon02.kim@samsung.com>
        <a571af00-8ac1-f1a5-3240-2c93f823c995@canonical.com>
        <001001d7d153$5fb18840$1f1498c0$@samsung.com>
        <5b05ff2e-953c-d1a3-8347-4d3f9911cc49@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Krzysztof

> On 04/11/2021 09:10, Jaewon Kim wrote:
> >
> >>> +	if (ret) {
> >>> +		dev_err(dev, "usi-sysreg offset is not specified\n");
> >>> +		return ret;
> >>> +	}
> >>> +
> >>> +	regmap_update_bits(i2c->usi_sysreg, i2c->usi_offset,
> >>> +			SYSREG_USI_SW_CONF_MASK, SYSREG_I2C_SW_CONF);
> >>> +
> >>> +	exynos_usi_reset(i2c);
> >>
> >> You are clearing the reset flag, but not setting it back on probe
> >> failure. What happens if the probe fails after this clear()? E.g.
> >> because of deferred probe? The next probe try will start on a not-reset controller. Will it work?
> >>
> >
> > The user manual guides USI_RESET to be done after changing the system register.
> > For clarity, we will change not only to clear reset, but to clear after reset.
> >
> 
> What I meant, is do you handle probe failure correctly (e.g. probe deferral)? It's fine to leave the
> reset cleared after deferred probe?
> 

I understood.
In my opinion, rather than resetting USI_CON_RESET in the probe fail case.
It seems it is more clear to set the reset as shown below.

val = readl(i2c->regs + USI_CON);
val |= USI_CON_RESET;
writel(val, i2c->regs + USI_CON);
udelay(1);

val = readl(i2c->regs + USI_CON);
val &= ~USI_CON_RESET;
writel(val, i2c->regs + USI_CON);


> Best regards,
> Krzysztof

Thanks
Jaewon Kim

