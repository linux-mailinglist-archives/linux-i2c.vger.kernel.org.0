Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FCA252474
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 01:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHYXut (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 19:50:49 -0400
Received: from anchovy3.45ru.net.au ([203.30.46.155]:55392 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbgHYXut (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Aug 2020 19:50:49 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Aug 2020 19:50:48 EDT
Received: (qmail 18469 invoked by uid 5089); 25 Aug 2020 23:44:07 -0000
Received: by simscan 1.2.0 ppid: 18331, pid: 18332, t: 0.0840s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.22?) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 25 Aug 2020 23:44:06 -0000
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
To:     Wolfram Sang <wsa@the-dreams.de>, Codrin.Ciubotariu@microchip.com,
        kamel.bouhara@bootlin.com, linux-arm-kernel@lists.infradead.org,
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
 <65d83bb0-9a0c-c6e2-1c58-cb421c69816c@electromag.com.au>
 <20200825132846.GA1753@kunai>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <8deeae50-2d67-d728-7afd-1b8f1b7a927e@electromag.com.au>
Date:   Wed, 26 Aug 2020 07:44:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825132846.GA1753@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25/08/2020 21:28, Wolfram Sang wrote:
> Hi Phil,
> 
> yes, this thread is old but a similar issue came up again...
> 
> On Fri, Oct 25, 2019 at 09:14:00AM +0800, Phil Reid wrote:
> 
>>>
>>>> So at the beginning of a new transfer, we should check if SDA (or SCL?)
>>>> is low and, if it's true, only then we should try recover the bus.
>>>
>>> Yes, this is the proper time to do it. Remember, I2C does not define a
>>> timeout.
>>>
>>
>> FYI: Just a single poll at the start of the transfer, for it being low, will cause problems with multi-master buses.
>> Bus recovery should be attempted after a timeout when trying to communicate, even thou i2c doesn't define a timeout.
>>
>> I'm trying to fix the designware drivers handling of this at the moment.
> 
> I wonder what you ended up with? You are right, a single poll is not
> enough. It only might be if one applies the new "single-master" binding
> for a given bus. If that is not present, my best idea so far is to poll
> SDA for the time defined in adapter->timeout and if it is all low, then
> initiate a recovery.
> 

On my todo list still.

Our system eventually recovers at the moment and the multi-master bus
doesn't contain anything that's time critical to our systems operation.


-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
