Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E40C8132680
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgAGMj0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:39:26 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11744 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728247AbgAGMjZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:39:25 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147beb0001>; Tue, 07 Jan 2020 04:39:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:39:24 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 04:39:24 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:39:24 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:39:22 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Mikko Perttunen" <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 9/9] i2c: tegra: Check DMA completion status in
 addition to left time
In-Reply-To: <20200106010423.5890-10-digetx@gmail.com>
References: <20200106010423.5890-10-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <72761d8598d248fbab872ad844b14aab@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:39:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400747; bh=AKbqWXt6tus+RjyhQVNrtBcDUbM9QcEwFDgkbLAeWGc=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=M+Hb5JXo5xPCFJvY6u72VG77v1ZutehPjDiEnyqQ4rP1Nf6hKHMJi34QoxLAhUK3+
         6sL7+1YLWPSMYUlcXsWVDSvw4mUQpAK5h/xWasBfKgezNSDxZrNYZOnjjy+kjBcYKH
         YiIEjxEKewypYO3/HWiDt1p9G64Nrvk3En1gcAo+8jDU6FVNcs9orkuVmM52cYReT9
         bnB2ovNFkYZEmLWOtMT+yMAVOjSygnZmeUmDoEWbg7hHcJjg/D9OM0yGOneeJgnghz
         pA7zB+Xvw2hbXE4YQ31Q9UXB0xMM1u4qhKnZcbYIDYqBinx0OhH0LUW7zlzUW8VzWw
         2QZwR8cNm7NtA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:23 +0300, Dmitry Osipenko wrote:
> It is more robust to check completion status in addition to the left time
> in a case of DMA transfer because transfer's completion happens in two
> phases [one is ISR, other is tasklet] and thus it is possible that DMA is
> completed while I2C completion awaiting times out because of the deferred
> notification done by the DMA driver. The DMA completion status becomes
> 100% actual after DMA synchronization. This fixes spurious DMA timeouts
> when system is under load.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Thierry Reding <treding@nvidia.com>
