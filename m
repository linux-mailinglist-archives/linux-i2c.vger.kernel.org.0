Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D09FD142C9C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 14:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgATN4V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 08:56:21 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:33958 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726738AbgATN4V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jan 2020 08:56:21 -0500
Received: from [109.168.11.45] (port=46296 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1itXXP-0004oK-3X; Mon, 20 Jan 2020 14:56:19 +0100
Subject: Re: [PATCH 01/26] docs: i2c: sort index logically
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
 <20200120100850.001e032b@endymion>
 <e5d3656d-04a1-dd1b-e847-fb063e56a987@lucaceresoli.net>
Message-ID: <9073e6c2-1f82-6067-0d2a-3e8d32dca89a@lucaceresoli.net>
Date:   Mon, 20 Jan 2020 14:56:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e5d3656d-04a1-dd1b-e847-fb063e56a987@lucaceresoli.net>
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

On 20/01/20 10:22, Luca Ceresoli wrote:
> Hi Jean,
> 
> On 20/01/20 10:08, Jean Delvare wrote:
>> Hi Luca,
>>
>> On Sun,  5 Jan 2020 23:49:47 +0100, Luca Ceresoli wrote:
>>> The index page currently lists sections in alphabetical file order without
>>> caring about their content. Sort sections based on their content logically,
>>> according to the following structure:
>>>
>>>  * Intro to I2C/SMBus and their usage in Linux: summary, i2c-protocol,
>>>    smbus-protocol, instantiating-devices, busses/index, i2c-topology,
>>>    muxes/i2c-mux-gpio
>>>  * Implementing drivers: writing-clients, dev-interface,
>>>    dma-considerations, fault-codes, functionality
>>>  * Debugging: gpio-fault-injection, i2c-stub
>>>  * Slave I2C: slave-interface, slave-eeprom-backend
>>>  * Advanced: ten-bit-addresses
>>>  * Obsolete info: upgrading-clients, old-module-parameters
>>
>> Good idea. I wonder, would there be a way to materialize these group
>> names in the documentation itself? I found it useful when reviewing the
>> patch, but in the long term it would be even more useful if the end
>> readers would see them too.
> 
> I had the same idea, but didn't find an obvious way to do it with the
> ReST/Sphynx syntax. I have also browsed through a few index pages for
> other subsystems and they all have a flat list too, so for the moment I
> gave up.

The best way I could find is in Documentation/core-api/index.rst
(https://www.kernel.org/doc/html/latest/core-api/index.html). I don't
like very much how the .rst source looks like, but AFAICT this seems
like "the" way of doing it.

Unless there are better options, I'll try this syntax in v2.

-- 
Luca
