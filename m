Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED9CF13266F
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgAGMjE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:39:04 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:11029 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbgAGMjD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:39:03 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147bd50001>; Tue, 07 Jan 2020 04:38:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:39:03 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 04:39:03 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:39:02 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:39:00 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/9] i2c: tegra: Prevent interrupt triggering after
 transfer timeout
In-Reply-To: <20200106010423.5890-4-digetx@gmail.com>
References: <20200106010423.5890-4-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <8cbdb84a50244e299297e74e7d203a0e@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:39:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400726; bh=xTmzxQHr1zJ3hGK7bLeEVcatI2W1vrsrMcVi6+Oirn8=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=dKkXcZR34JCTHirWJmB/SUZVGsdzEAkNLTpGfdiRsXfPo1yyGOaVJBtfPhZEGbIDO
         ZhEFgVPrDF7vpMi0++iGRZ1T8st1I6QynOFUA2hdWLCF4tPJxw8TiORJP42omIt3aY
         KZRDkYraJnpKOSRj7wLrfbsgAS5dw6ThMcm7xQyradIhVZHXDkoNEmbn+sCBZe1mpB
         tCOETgcVsZOtA702WFMVByKfyAr+sMj88+e2/FLj1zm/vDhExC/9MHuicCpLaFpk+T
         f165cfuEn/2NKPnOYQkypHRQP/bOvjWszi/mZ/jESMlGre58CwjrvtZktjzXFg2Bo6
         7W3l5MQlnaDhw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:17 +0300, Dmitry Osipenko wrote:
> Potentially it is possible that interrupt may fire after transfer timeout.
> That may not end up well for the next transfer because interrupt handling
> may race with hardware resetting.
> 
> This is very unlikely to happen in practice, but anyway let's prevent the
> potential problem by enabling interrupt only at the moments when it is
> actually necessary to get some interrupt event.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 70 +++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 34 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
