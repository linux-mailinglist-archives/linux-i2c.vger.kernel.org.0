Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2541606CA
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Feb 2020 22:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgBPVqn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Feb 2020 16:46:43 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:50136 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726020AbgBPVqn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 Feb 2020 16:46:43 -0500
Received: from [78.134.119.80] (port=47938 helo=[192.168.77.51])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1j3RkN-00HZMA-Qj; Sun, 16 Feb 2020 22:46:39 +0100
Subject: Re: [PATCH] i2c: use kobj_to_dev() API
To:     qiwuchen55@gmail.com, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
References: <1581684997-8322-1-git-send-email-qiwuchen55@gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <d30a1c9a-ad23-1c6a-4195-7a8dd10a9813@lucaceresoli.net>
Date:   Sun, 16 Feb 2020 22:46:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581684997-8322-1-git-send-email-qiwuchen55@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 14/02/20 13:56, qiwuchen55@gmail.com wrote:
> From: chenqiwu <chenqiwu@xiaomi.com>
> 
> Use kobj_to_dev() API instead of container_of().
> 
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
