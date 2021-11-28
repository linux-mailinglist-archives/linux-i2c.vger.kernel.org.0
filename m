Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D194606E9
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Nov 2021 15:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344851AbhK1Odc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Nov 2021 09:33:32 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:49482 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352701AbhK1Obc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Nov 2021 09:31:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7CA5EB80B63;
        Sun, 28 Nov 2021 14:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509EBC004E1;
        Sun, 28 Nov 2021 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638109693;
        bh=oW5W4Qn4gkvmMPuApEJopX32RKgMPMB6E1QpTUiASBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kUN7McQXCi42L42eU2vaet8RVyJZILTENrYATmD130pqqNTAsSvyviKzudfBq7xbE
         Ny1/XBL8REpx0FY4vlYXfuWexnZeqi91i7cAI5VfsiVqFdGlOzGLUcZegOgPTmSVk+
         CB3f9QCumKToA1C56EDcLpfFuXY1RKCmFCqyaEi4=
Date:   Sun, 28 Nov 2021 15:28:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/8] tty: serial: samsung: Remove USI initialization
Message-ID: <YaOR+TbcR1V4ovf/@kroah.com>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
 <20211127223253.19098-5-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127223253.19098-5-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Nov 28, 2021 at 12:32:49AM +0200, Sam Protsenko wrote:
> USI control is now extracted to dedicated USIv2 driver. Remove USI
> related code from serial driver to avoid conflicts and code duplication.

What conflicts?

What duplication?  All you did here was delete code.

confused,

greg k-h
