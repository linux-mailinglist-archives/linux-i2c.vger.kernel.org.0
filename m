Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39EF4293BA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 17:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239236AbhJKPsj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 11:48:39 -0400
Received: from eu-shark2.inbox.eu ([195.216.236.82]:48664 "EHLO
        eu-shark2.inbox.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238923AbhJKPsi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 11:48:38 -0400
X-Greylist: delayed 495 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Oct 2021 11:48:38 EDT
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
        by eu-shark2-out.inbox.eu (Postfix) with ESMTP id 4C0E71E00603;
        Mon, 11 Oct 2021 18:38:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
        t=1633966701; bh=o7R0Au5IFBkQndLoGctiAVfvFZ84avgC7Sm8RCkpCHk=;
        h=Date:From:To:Cc:Subject;
        b=B0UNSCIfEAkXeD0imeYbLIZ2o3/77naYp9Rc0OxB3p4mxIm2950NAJVsrNwIV9XE/
         b9GNaZZXYIJloxpOmW0BMZnB51D1cc23+41PeYTumkxHoL2Xv9kyovx7F/OoPR7EAv
         B8MGHnN3GjDQrYHf+MFT1rscvze3AersbfroEQeI=
Received: from localhost (localhost [127.0.0.1])
        by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 42B7B1E00602;
        Mon, 11 Oct 2021 18:38:21 +0300 (EEST)
Received: from eu-shark2.inbox.eu ([127.0.0.1])
        by localhost (eu-shark2.inbox.eu [127.0.0.1]) (spamfilter, port 35)
        with ESMTP id qsX0R9Y6rPyC; Mon, 11 Oct 2021 18:38:20 +0300 (EEST)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
        by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 9B5021E00600;
        Mon, 11 Oct 2021 18:38:20 +0300 (EEST)
Received: from pc (unknown [2.58.44.26])
        (Authenticated sender: arzamas-16@mail.ee)
        by mail.inbox.eu (Postfix) with ESMTPA id E6C001BE01A9;
        Mon, 11 Oct 2021 18:38:19 +0300 (EEST)
Date:   Mon, 11 Oct 2021 18:38:14 +0300
From:   Boris Lysov <arzamas-16@mail.ee>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <matthias.bgg@gmail.com>, <qii.wang@mediatek.com>
Subject: Re: [PATCH v8 2/5] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
Message-ID: <20211011183814.488ed866@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: OK
X-ESPOL: +dBm1NUOBlzQh1+kSn3cDQIzqylVPp7o/vvJoxAn4GeDUSOGYE0FThSzg25wUQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 10 Oct 2021 15:05:13 +0800
Kewei Xu <kewei.xu@mediatek.com> wrote:

> When a timeout error occurs in i2c transter, it is usually related
> to the i2c/dma IP hardware configuration. Therefore, the purpose of
> this patch is to dump the key register values of i2c/dma when a
> timeout occurs in i2c for debugging.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

I would like to test this patchset on one of supported platforms, an
mt6577-powered device. This driver requires a DMA base...
> 	i2c->pdmabase = devm_ioremap_resource(&pdev->dev, res);
>	if (IS_ERR(i2c->pdmabase))
>		return PTR_ERR(i2c->pdmabase);
... however I am not sure what address should I specify in the .dts file. While
other i2c busses supported by this driver such as mt6589 [1][2] and mt6797 [3]
have designated DMA for I2C, mt6577 seems to lack dedicated DMA engine for I2C
[4][5].

Do I need to specify the Generic DMA base address [4] instead?

Worth mentioning I brought up this issue in the past [5][6].

[1] ALPS.KK1.MP5.V1.3_EASTAEON89_WET_KK source code (downstream)
[2] MT6589 HSPA+ Smartphone Application Processor Datasheet v1.0, page 869
[3] MT6797 LTE-A Smartphone Application Processor Register Table (Part 1) v1.1,
page 1796
[4] MT6577 HSPA Smartphone Application Processor Datasheet v0.94, page 547
[5] ALPS.JB.MP.V1.19_MBK77_TB_JB source code (downstream)
[6] https://marc.info/?l=devicetree&m=159949247901831&w=2
[7] https://marc.info/?l=linux-i2c&m=159939730714187&w=2
