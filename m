Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52262160CA2
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 09:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgBQIN2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 03:13:28 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:54735 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726932AbgBQIN1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 03:13:27 -0500
Received: from [109.168.11.45] (port=53996 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1j3bWv-004PuW-4C; Mon, 17 Feb 2020 09:13:25 +0100
Subject: Re: [PATCH] i2c: omap: use devm_platform_ioremap_resource()
To:     qiwuchen55@gmail.com, vigneshr@ti.com, tony@atomide.com,
        aaro.koskinen@iki.fi
Cc:     linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        chenqiwu <chenqiwu@xiaomi.com>
References: <1581755803-11242-1-git-send-email-qiwuchen55@gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <0e6c38d0-e3fd-de24-a24e-33aa4168bcee@lucaceresoli.net>
Date:   Mon, 17 Feb 2020 09:13:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581755803-11242-1-git-send-email-qiwuchen55@gmail.com>
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

Hi,

On 15/02/20 09:36, qiwuchen55@gmail.com wrote:
> From: chenqiwu <chenqiwu@xiaomi.com>
> 
> Use a new API devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>

Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
