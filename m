Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082DFC49F5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2019 10:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbfJBIuD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Oct 2019 04:50:03 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:30907 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfJBIuC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Oct 2019 04:50:02 -0400
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Oct 2019 04:50:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570006200;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iUttmko10pMSiNzf83MKiTk9CuVcL1m274VDNhwoUvo=;
        b=fwQnjnwZGpqSYouAPj03EV3kLB+dGJ/RGE5M5UX6f4bOmTXpmL7QDjz9o44g7Pe/nV
        KwlLnhotooxXgELLLi2HOzeHToCrbYQuIqfzK3W6tpskvn4XY+K6M6pllUhSKqoo/Vvw
        UidFNpcYmrqDnjvIH36lgIQEmx55paOCwC09aL2RG6MIN+o8SkeCBssl8CDha+0uC1U4
        ZdKQtPEb3i99mvOMYJiQodU/LiBgQxe7jlAj5h6Efkdfu0/LcESoxdR6V31AMZTuZjon
        pqYUYEClFPVa1rsYQi1WmN5ZcmgWdTOsdnK+Tq/KKvaFDSX6imJxi41CneU9sOvOBoRK
        X2Og==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.28.0 AUTH)
        with ESMTPSA id i07086v928htVNM
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 2 Oct 2019 10:43:55 +0200 (CEST)
Date:   Wed, 2 Oct 2019 10:43:55 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Fabien Parent <fparent@baylibre.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     drinkcat@chromium.org, wsa@the-dreams.de, hsinyi@chromium.org,
        matthias.bgg@gmail.com, tglx@linutronix.de, qii.wang@mediatek.com
Message-ID: <1733244772.936156.1570005835848@webmail.strato.com>
In-Reply-To: <20190930152846.5062-1-fparent@baylibre.com>
References: <20190930152846.5062-1-fparent@baylibre.com>
Subject: Re: [PATCH v2] i2c: i2c-mt65xx: fix NULL ptr dereference
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev20
X-Originating-IP: 85.212.176.126
X-Originating-Client: open-xchange-appsuite
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On September 30, 2019 at 5:28 PM Fabien Parent <fparent@baylibre.com> wrote:
> 
> 
> Since commit abf4923e97c3 ("i2c: mediatek: disable zero-length transfers
> for mt8183"), there is a NULL pointer dereference for all the SoCs
> that don't have any quirk. mtk_i2c_functionality is not checking that
> the quirks pointer is not NULL before starting to use it.
> 
> This commit add a call to i2c_check_quirks which will check whether
> the quirks pointer is set, and if so will check if the IP has the
> NO_ZERO_LEN quirk.
> 
> Fixes: abf4923e97c3 ("i2c: mediatek: disable zero-length transfers for mt8183")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Thank you! Tested successfully on Acer R13 Chromebook (mt8173).

Tested-by: Ulrich Hecht <uli@fpond.eu>

CU
Uli
