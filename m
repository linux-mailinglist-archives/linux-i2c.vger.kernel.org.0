Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B00C6E40F9
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2019 03:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388799AbfJYBU4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 21:20:56 -0400
Received: from anchovy1.45ru.net.au ([203.30.46.145]:58359 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388798AbfJYBUz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 21:20:55 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Oct 2019 21:20:54 EDT
Received: (qmail 17092 invoked by uid 5089); 25 Oct 2019 01:14:13 -0000
Received: by simscan 1.2.0 ppid: 16948, pid: 16950, t: 0.0537s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 25 Oct 2019 01:14:13 -0000
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
To:     Wolfram Sang <wsa@the-dreams.de>, Codrin.Ciubotariu@microchip.com
Cc:     kamel.bouhara@bootlin.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        Ludovic.Desroches@microchip.com, devicetree@vger.kernel.org,
        thomas.petazzoni@bootlin.com
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
 <20191021202044.GB3607@kunai>
 <724d3470-0561-1b3f-c826-bc16c74a8c0a@bootlin.com>
 <1e70ae35-052b-67cc-27c4-1077c211efd0@microchip.com>
 <20191024150726.GA1120@kunai>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <65d83bb0-9a0c-c6e2-1c58-cb421c69816c@electromag.com.au>
Date:   Fri, 25 Oct 2019 09:14:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024150726.GA1120@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/10/2019 23:07, Wolfram Sang wrote:
> 
>> So at the beginning of a new transfer, we should check if SDA (or SCL?)
>> is low and, if it's true, only then we should try recover the bus.
> 
> Yes, this is the proper time to do it. Remember, I2C does not define a
> timeout.
> 

FYI: Just a single poll at the start of the transfer, for it being low, will cause problems with multi-master buses.
Bus recovery should be attempted after a timeout when trying to communicate, even thou i2c doesn't define a timeout.

I'm trying to fix the designware drivers handling of this at the moment.

-- 
Regards
Phil Reid

