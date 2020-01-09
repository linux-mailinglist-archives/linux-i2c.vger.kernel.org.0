Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB0391355C1
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 10:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbgAIJ3A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 04:29:00 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:37155 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729460AbgAIJ3A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 04:29:00 -0500
Received: from [109.168.11.45] (port=60086 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ipU7d-00FOyB-S4; Thu, 09 Jan 2020 10:28:57 +0100
Subject: Re: [PATCH 1/4] i2c: xiic: Fix kerneldoc warnings
To:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
References: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <81cf9f79-f11c-4392-d920-cc003015f743@lucaceresoli.net>
Date:   Thu, 9 Jan 2020 10:28:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
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

Hi Shubhrajyoti,

On 09/01/20 07:03, shubhrajyoti.datta@gmail.com wrote:
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

This patch has already been applied (in an improved version) and is in
mainline now.

-- 
Luca
