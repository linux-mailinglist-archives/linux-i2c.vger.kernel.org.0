Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC4AEF6A0
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2019 08:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387832AbfKEHwZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Nov 2019 02:52:25 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:54285 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387711AbfKEHwZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Nov 2019 02:52:25 -0500
Received: from [109.168.11.45] (port=56876 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iRtdX-001cmN-9m; Tue, 05 Nov 2019 08:52:23 +0100
Subject: Re: [PATCHv2] i2c: xiic: Fix kerneldoc warnings
To:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
References: <1572931665-24560-1-git-send-email-shubhrajyoti.datta@gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <fd50278e-a3ef-3440-7dab-ce2ad987bb37@lucaceresoli.net>
Date:   Tue, 5 Nov 2019 08:52:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572931665-24560-1-git-send-email-shubhrajyoti.datta@gmail.com>
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

On 05/11/19 06:27, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> Fix the below warning by adding the description of clock and dev.
> 
> drivers/i2c/busses/i2c-xiic.c:57: info: Scanning doc for struct xiic_i2c
> drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
> 'dev' not described in 'xiic_i2c'
> drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
> 'clk' not described in 'xiic_i2c'
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
