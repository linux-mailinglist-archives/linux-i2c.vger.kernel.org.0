Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA49272014
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIUKU3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:20:29 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18314 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKU3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:20:29 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e60000d>; Mon, 21 Sep 2020 03:20:16 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:28 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:26 +0000
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
Subject: Re: [PATCH v7 28/34] i2c: tegra: Consolidate error handling in
 tegra_i2c_xfer_msg()
In-Reply-To: <20200908224006.25636-29-digetx@gmail.com>
References: <20200908224006.25636-29-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <9afe07b62c5c4bfaba2dafc2e146fdb4@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683616; bh=UancnqUnvAK8EPy0sy7KrTzvIPmdmdkysH0owfKLrrQ=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=eO2pv0sFTFsqFzp6N3YKFrFy0OP/U4h/7zbUtqBbU7iXzKyo+Q99jPnrhER4dJhWz
         W3ALnwcLxYYItrfryUzy8zJF2Jmi8q+lWE5O//GOg+rg2BOo88a+T5zJ0CyxidBVRd
         o95ksy+Zo+IvLG1JjBkWTW4AuWAeEgjekI6NNHouhKQBg/vR1c7k9g4A2X9XIRE43a
         PpGqkWI10WJuudWEjHVCKGLnqnG1FUq6fEuzXUp2JiYoq5+ZzL0xeJEEsAmYFEog5R
         kF0m9jko/bOfqd0knwL/fJka3M3QomHQZPz1f5y3zLbMnAuF24E9M0Bcv1dLlIKsU2
         Ux8alPngLdZ7A==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:40:00 +0300, Dmitry Osipenko wrote:
> Consolidate error handling in tegra_i2c_xfer_msg() into a common code
> path in order to make code cleaner.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
