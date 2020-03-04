Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17D1E1795A5
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Mar 2020 17:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbgCDQse (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Mar 2020 11:48:34 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55272 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388084AbgCDQse (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Mar 2020 11:48:34 -0500
Received: from [109.168.11.45] (port=42108 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1j9XCB-00CBrc-Fn; Wed, 04 Mar 2020 17:48:31 +0100
Subject: Re: [PATCH v2 2/2] i2c: smbus: remove outdated references to irq
 level triggers
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Robert Richter <rrichter@marvell.com>
References: <20200228171221.5412-1-wsa+renesas@sang-engineering.com>
 <20200228171221.5412-3-wsa+renesas@sang-engineering.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <66ee4375-91a8-9286-629a-cd1fdef2b71e@lucaceresoli.net>
Date:   Wed, 4 Mar 2020 17:48:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228171221.5412-3-wsa+renesas@sang-engineering.com>
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

On 28/02/20 18:12, Wolfram Sang wrote:
> IRQ levels are now handled within the IRQ core. Remove the forgotten
> references from the documentation.
> 
> Fixes: 9b9f2b8bc2ac ("i2c: i2c-smbus: Use threaded irq for smbalert")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
