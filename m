Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBA5FAF01
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 11:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbfKMKwu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 05:52:50 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:42710 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726340AbfKMKwu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 05:52:50 -0500
Received: from [109.168.11.45] (port=55358 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iUqGV-002Rdw-KG; Wed, 13 Nov 2019 11:52:47 +0100
Subject: Re: [PATCH] i2c: rcar: Remove superfluous call to clk_get_rate()
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20191113101453.28157-1-geert+renesas@glider.be>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <262da1ec-f978-9109-3536-3400acb1981d@lucaceresoli.net>
Date:   Wed, 13 Nov 2019 11:52:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113101453.28157-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On 13/11/19 11:14, Geert Uytterhoeven wrote:
> Variable "rate" already contains the current clock rate, so use that
> rather than calling clk_get_rate() again.
> 
> Fixes: 8d0494037bb2af32 ("i2c: rcar: get clock rate only once and simplify calculation")

Not sure this should be considered a fix. The code is not broken, it's
only non-optimal.

But anyway, with or without the "Fixes" line:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
