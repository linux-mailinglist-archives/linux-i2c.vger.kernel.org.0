Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269E11A48C4
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Apr 2020 19:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDJRFS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Apr 2020 13:05:18 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:33895 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726142AbgDJRFS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Apr 2020 13:05:18 -0400
Received: from [5.157.111.77] (port=58954 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jMx5f-005r4M-Q0; Fri, 10 Apr 2020 19:05:15 +0200
Subject: Re: [RFC PATCH v2 5/6] i2c: of: mark a whole array of regs as
 reserved
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-6-wsa+renesas@sang-engineering.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <6ebd789e-879c-6f58-2c20-abecad2ce57f@lucaceresoli.net>
Date:   Fri, 10 Apr 2020 19:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-6-wsa+renesas@sang-engineering.com>
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

On 18/03/20 16:00, Wolfram Sang wrote:
> Back then, 'reg' properties in I2C DT bindings only contained one
> address and this address was assigned a device and, thus, blocked.
> Meanwhile, chips using multiple addresses are common and the 'reg'
> property can be an array described by 'reg-names'. This code enhances
> I2C DT parsing, so it will reserve all addresses described in an array.
> They will be bound to the 'dummy' driver as 'reserved' iff the first
> address can be assigned successfully. If that is not the case, the array
> is not further considered. If one later address of the array can not be
> assigned, it will be reported but we don't bail out. The driver has to
> decide if that address is critical or not.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
