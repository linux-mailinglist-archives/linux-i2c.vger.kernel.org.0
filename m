Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56BE4ECB3C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2019 23:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKAWPr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Nov 2019 18:15:47 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:57090 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725989AbfKAWPr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Nov 2019 18:15:47 -0400
X-Greylist: delayed 1151 seconds by postgrey-1.27 at vger.kernel.org; Fri, 01 Nov 2019 18:15:46 EDT
Received: from [88.147.30.77] (port=48590 helo=[192.168.77.50])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iQeuH-008E5q-0w; Fri, 01 Nov 2019 22:56:33 +0100
Subject: Re: [PATCH resend] i2c: core: Use DEVICE_ATTR_RW() helper macros
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191025091950.23563-1-geert+renesas@glider.be>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <9ac7a889-ca10-649e-9404-1f785645f8b8@lucaceresoli.net>
Date:   Fri, 1 Nov 2019 22:56:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025091950.23563-1-geert+renesas@glider.be>
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

Hi Geert,

On 25/10/19 11:19, Geert Uytterhoeven wrote:
> Convert the i2c core sysfs attributes from DEVICE_ATTR() to
> DEVICE_ATTR_RW(), to reduce boilerplate.
> This requires renaming some functions.

Nitpicking: it's DEVICE_ATTR_RO and _WO, not _RW (both here and in the
subject). I'd replace with 'DEVICE_ATTR_*()'.

With this fixed:
 Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
