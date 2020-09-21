Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95B92720D4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgIUKZi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:25:38 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9259 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIUKZi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:25:38 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e470001>; Mon, 21 Sep 2020 03:19:52 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:37 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:34 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 30/34] i2c: tegra: Clean up variable names
In-Reply-To: <20200908224006.25636-31-digetx@gmail.com>
References: <20200908224006.25636-31-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <bcaa97f37da44f9cb683d56ad61dadf7@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683592; bh=JfxTTJy+J3gpSKXyQSD0D8YeOpOU2N29tKNLl3yaQcw=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=RSZNVenTsrz9smqn4QKB3PxX4gMNyhvNyYvWUShoX/zybnmmchmjr6zOtMRqQWKBA
         slq7kFiNhhNgOqyZFry8tgaBb9nqqUTx6Zo/zrmEGEfnkBi5mxlxY+J91OVZSd00Cs
         kXaTqGS9KQ3/Dzvlnd3gSVcfhrDO97pBCzdT+gRScGA/qXoz41l7lu70OJL2qHq2bB
         ojL6/GCbtcig7c6n52qgs/wTh/hUz8W3w4XY+NqQN8P52XXgJt/e54FErejZ9697Bb
         D0pBOPZg5PZNf5FDOqWlhYlrhEv8UOe/Qky9YFwRXCPp7451AnlfsY2k5Z5Ej6BNBT
         6H4TORa9Z6GXA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:40:02 +0300, Dmitry Osipenko wrote:
> Rename "ret" variables to "err" in order to make code a bit more
> expressive, emphasizing that the returned value is an error code.
> Same vice versa, where appropriate.
> 
> Rename variable "reg" to "val" in order to better reflect the actual
> usage of the variable in the code and to make naming consistent with
> the rest of the code.
> 
> Use briefer names for a few members of the tegra_i2c_dev structure in
> order to improve readability of the code.
> 
> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
> code style across the driver.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 173 ++++++++++++++++-----------------
>  1 file changed, 86 insertions(+), 87 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
