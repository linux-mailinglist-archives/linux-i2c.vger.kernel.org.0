Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF24114FAF
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2019 12:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfLFLST (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Dec 2019 06:18:19 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:43385 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726070AbfLFLST (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Dec 2019 06:18:19 -0500
Received: from [109.168.11.45] (port=42022 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1idBcm-000Duq-UK; Fri, 06 Dec 2019 12:18:16 +0100
Subject: Re: [PATCH] i2c: remove i2c_new_dummy() API
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191206002322.12801-1-wsa+renesas@sang-engineering.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <807fbd1b-c5aa-898d-fe81-4df107b3d35a@lucaceresoli.net>
Date:   Fri, 6 Dec 2019 12:18:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191206002322.12801-1-wsa+renesas@sang-engineering.com>
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

Hi Wolfram,

On 06/12/19 01:23, Wolfram Sang wrote:
> All in-kernel users have been converted to
> {devm_}i2c_new_dummy_device(). Remove the old API.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
