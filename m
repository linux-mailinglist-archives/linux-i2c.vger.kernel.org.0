Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A421AC757
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 16:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405004AbgDPOyF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 10:54:05 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:54697 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394837AbgDPOxV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 10:53:21 -0400
Received: from [88.147.80.45] (port=36640 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jP5t7-00283A-Tv; Thu, 16 Apr 2020 16:53:10 +0200
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
 <20200415075911.GA1141@ninjato>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e1791500-d7ca-f6d0-44ff-8d830de4bf58@lucaceresoli.net>
Date:   Thu, 16 Apr 2020 16:53:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415075911.GA1141@ninjato>
Content-Type: text/plain; charset=windows-1252
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

On 15/04/20 09:59, Wolfram Sang wrote:
> 
>> As I said in the reply to v1, I think we should reserve addresses also
>> when there is a compatible string but no matching driver, but this is
>> another story and can be handled separately.
> 
> Unless I misunderstand you, I think they do already. Note that
> only 'i2cdetect' shows a device as busy *IFF* there is a driver bound to
> it. The internal 'i2c_check_addr_busy' does not care about a driver
> being bound. You can check this by trying to use
> i2c_new_ancillary_device() with an address which is already described in
> DT but which driver is disabled.
> 

Ah, yes! I was assuming the opposite but I double checked and you're
right of course.

Sorry for the noise.

-- 
Luca
