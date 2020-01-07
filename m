Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8B713267A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgAGMjP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:39:15 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17852 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728193AbgAGMjO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:39:14 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147bc20000>; Tue, 07 Jan 2020 04:38:26 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:39:13 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 04:39:13 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:39:13 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:39:11 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/9] i2c: tegra: Use relaxed versions of readl/writel
In-Reply-To: <20200106010423.5890-7-digetx@gmail.com>
References: <20200106010423.5890-7-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <41ab5d2ace574878a8cb3ec35dbd0a30@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:39:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400706; bh=w7K6WnQIKwOJEaRFceFzCE7LfhdUIhbptHFCV+dF3rM=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=YMPQ+5e4tUxMk/DiOASAanrTC0Z07sr+SusuEDOsrTx4ovvP63+Fd4SNJWvLVIx9X
         GQXMGY0rFlWNSPENEiMoD7/ed0XDwaFQuICFI8JCkl/JwyKJ6q9HuIxwt/FimI6IK/
         YP/hnyI1n3psip7AbKkLiFwWbmUKonE4jPjUE3hqIjBXw1c5dhjz4euUhfLMBLBPLQ
         Jxs414BChN4r+4NEnMn+8x7t/B3MEjUhmlZ/HbwYqA2dgAv0PeWTyjmYY5n/vE+7vL
         DlprDYaWkLFD0TGumE2M2ao26S1IGxsE01gJ7aP7JTwjaqLA04urALjyU5xvn7eolJ
         xRAxzA9sQlWAw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:20 +0300, Dmitry Osipenko wrote:
> There is nothing to synchronize in regards to memory accesses for PIO
> transfers and for DMA transfers the DMA API takes care of the syncing.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
