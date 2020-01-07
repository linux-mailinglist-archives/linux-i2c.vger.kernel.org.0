Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACF0132688
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 13:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgAGMje (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 07:39:34 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11714 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbgAGMjF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 07:39:05 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e147bd20000>; Tue, 07 Jan 2020 04:38:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 07 Jan 2020 04:38:59 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 07 Jan 2020 04:38:59 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 12:38:59 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 12:38:57 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/9] i2c: tegra: Properly disable runtime PM on
 driver's probe error
In-Reply-To: <20200106010423.5890-3-digetx@gmail.com>
References: <20200106010423.5890-3-digetx@gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <7497908b738d4f19a908dbd20736fda6@HQMAIL105.nvidia.com>
Date:   Tue, 7 Jan 2020 12:38:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578400722; bh=Mwc3R9BWFhwxMeMItKqek+VJgVgKaAJiPIg+FJe1cd4=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=dDu5JEQzAm8sHZa0M+i7mUyZMWCbCsKHk214c+A62+zCY1c6RKDmuaQ/BYXD3NTCX
         buxeVZlEjS5tUsKUK7OyflJaZKKuVeYp8uN8HzOMAcBiW39wMV5VrbFBDV4sotrj86
         w2ms/FwRB3ao4GJiiuNBlUZrfe/ji/VRa8k7URc4FoD5DDZO8UgCzXMhDowHILDw/+
         OQXkjDhNFWXO112FW9tDBtBocPSDvPHVcAaC3y/LyKseGgf3NJHBEHivJmQk8bSW4M
         +BCfZQ5oIP6n1qyD+AqBuYlEA901Lm+A9k8lx6lKIAcu9PeSOHtuabHNNFAQspokI1
         cqceqqI22jSXA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jan 2020 04:04:16 +0300, Dmitry Osipenko wrote:
> One of the recent Tegra I2C commits made a change that resumes runtime PM
> during driver's probe, but it missed to put the RPM in a case of error.
> Note that it's not correct to use pm_runtime_status_suspended because it
> breaks RPM refcounting.
> 
> Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
