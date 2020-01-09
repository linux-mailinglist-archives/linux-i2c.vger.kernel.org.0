Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE6461355C3
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 10:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbgAIJ3B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 04:29:01 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:57112 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729476AbgAIJ3B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 04:29:01 -0500
Received: from [109.168.11.45] (port=60090 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ipU7f-00FOyg-7E; Thu, 09 Jan 2020 10:28:59 +0100
Subject: Re: [PATCH 4/4] i2c: xiic: Fix the clocking across bind unbind
To:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
References: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1578549819-14110-4-git-send-email-shubhrajyoti.datta@gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2973617a-7877-7058-dc0e-e47cc05e4882@lucaceresoli.net>
Date:   Thu, 9 Jan 2020 10:28:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578549819-14110-4-git-send-email-shubhrajyoti.datta@gmail.com>
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
> The recommendation is that the the set_active should be done

s/the the/the/

> withruntine disabled.

s/withruntine/with runtime/

-- 
Luca
