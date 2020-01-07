Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6778132677
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgAGMjM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:39:12 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11722 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728193AbgAGMjL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:39:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147bdd0000>; Tue, 07 Jan 2020 04:38:53 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:39:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 04:39:10 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:39:10 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:39:08 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Mikko Perttunen" <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/9] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to
 I2C_PIO_MODE_PREFERRED_LEN
In-Reply-To: <20200106010423.5890-6-digetx@gmail.com>
References: <20200106010423.5890-6-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <524a6623612e42638c198e64ba7afb8c@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:39:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400733; bh=waujjXovdS+MNBuMeexXtQRpJFaJSvSSlTTWtRiCDc8=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=ktgUAwoAC3m6d16S4o/KAp3Wih2iBYySuaLi230BhLbECIS7FNaE/h8gnOxPbxM4G
         ls3td+166KM9qdalHdaUnTLZOenyU/f2ey40qfEko6UtU26vAh4ikpif7oBlTjvZIe
         Ux/GL9ZNXKTMXr7DsuimUy7Iu7gyNBaTRq1dPJv/SAQ5knQtFlO4+pf4q2dhudwEDb
         5w3aYoFwmd2JYO3Xu5KxuIkx2zl+TtoF4zuxcw9Mj1novWiwvulz54F+odsLJQm5GO
         1j111boYNKw8dv/FZLLOhtplx33o6ERR8WuVgdtL5VCUfKy7F79/EtaeRXIPt21mRA
         NiMThbr4LPh1A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:19 +0300, Dmitry Osipenko wrote:
> DMA is preferred for a larger transfers, while PIO is preferred for a
> smaller transfers to avoid unnecessary DMA overhead. There is no strict
> size limitations for the PIO-mode transfers, so let's rename the constant
> for clarity.
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
