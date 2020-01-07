Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B73DD132684
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgAGMjX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:39:23 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11737 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgAGMjW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:39:22 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147be80000>; Tue, 07 Jan 2020 04:39:04 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:39:21 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 04:39:21 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:39:21 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:39:20 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:39:18 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Mikko Perttunen" <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 8/9] i2c: tegra: Always terminate DMA transfer
In-Reply-To: <20200106010423.5890-9-digetx@gmail.com>
References: <20200106010423.5890-9-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <da4ee98be8314ca296de364b79958b23@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:39:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400744; bh=Ui6pYdl8noV1LAIHBUWZU8Mb5CFNZKF2t/Rl4F5pRqM=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=GaOya4C4h/7nTO7qnHuRyqCqSwHM7NkzSMopi5glP6+7XKBfCFnF1P0NYnjRsLyWP
         K9SNGGLCTYsSJ2yKuKZdZF518b+WMu1BYjTuIGC2nu0FVVhztV+FuT9uOQOuExJqKK
         ls2WYZRn0sTmFRLbLS02Of2EdRLDgxBxBIHgkxwsOTkhHvCzbhrw55Gt3jp8wF7ACl
         gaJYPgWzma6nmQ1NpQKkP/cSC0MYScNyHGer03GAcVVKIdBOMNwE4AaWnvwT/9XLXU
         xhRVOn4Ai8H8jpBA4w/Vi9Co2fsTBrYKYhg1CMZU2wphXFJrtwb9WN4gE1nKHQmQ80
         8KvZ88L9msoIg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:22 +0300, Dmitry Osipenko wrote:
> It is possible that I2C could error out in the middle of DMA transfer and
> in this case DMA channel needs to be reset, otherwise a follow up transfer
> will fail because DMA channel stays blocked.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
