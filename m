Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548321C4B9D
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 03:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgEEBv0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 4 May 2020 21:51:26 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:40828 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgEEBvZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 May 2020 21:51:25 -0400
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 0451f7XU030462;
        Tue, 5 May 2020 09:41:07 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 5 May
 2020 09:51:21 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 5 May
 2020 09:51:19 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Tue, 5 May 2020 09:51:19 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Thread-Topic: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Thread-Index: AQHWHdeQ1mqTBOPAdE+n+yVhmYVsFKiRMjyAgAeRFwA=
Date:   Tue, 5 May 2020 01:51:19 +0000
Message-ID: <9192c38a24804689809fa80601ae9126@TWMBX02.aspeed.com>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
 <20200430141701.GC3355@ninjato>
In-Reply-To: <20200430141701.GC3355@ninjato>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.2.87]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0451f7XU030462
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> In AST2600 there have a slow peripheral bus between CPU  and i2c 
> controller.
> Therefore GIC i2c interrupt status clear have delay timing, when CPU 
> issue write clear i2c controller interrupt status.
> To avoid this issue, the driver need have read after write  clear at 
> i2c ISR.
> 
> Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>

>Applied to for-current with a Fixes tag, thanks! Please, try to add one next time and please also check how the subsystem formats the $subject line.
[Ryan Chen] Thanks your review, will add fixes tag at subject. 

