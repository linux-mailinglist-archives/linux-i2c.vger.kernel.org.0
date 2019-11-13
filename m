Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6474DFAD8E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 10:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfKMJr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 04:47:58 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:57618 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727445AbfKMJr6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 04:47:58 -0500
Received: from [109.168.11.45] (port=55110 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iUpFj-001uIA-Ox; Wed, 13 Nov 2019 10:47:55 +0100
Subject: Re: [PATCH v3 3/3] i2c: smbus: switch from loops to memcpy
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-iio@vger.kernel.orgi, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-4-dmitry.torokhov@gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <320567eb-00f5-2228-c507-317131b4af74@lucaceresoli.net>
Date:   Wed, 13 Nov 2019 10:47:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112203132.163306-4-dmitry.torokhov@gmail.com>
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

Hi Dmitry,

On 12/11/19 21:31, Dmitry Torokhov wrote:
> When copying memory from one buffer to another, instead of open-coding
> loops with byte-by-byte copies let's use memcpy() which might be a bit
> faster and makes intent more clear.

Good idea!

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
