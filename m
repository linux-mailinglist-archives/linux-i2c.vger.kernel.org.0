Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46807A9AC7
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 08:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfIEGma (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 02:42:30 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:59570 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfIEGma (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 02:42:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id 89105182C7;
        Thu,  5 Sep 2019 08:42:27 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id g8dJ4AEJqw_k; Thu,  5 Sep 2019 08:42:26 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
        by bastet.se.axis.com (Postfix) with ESMTPS id DCFE918488;
        Thu,  5 Sep 2019 08:42:26 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BC81A1A066;
        Thu,  5 Sep 2019 08:42:26 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B01F41A064;
        Thu,  5 Sep 2019 08:42:26 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
        by boulder02.se.axis.com (Postfix) with ESMTP;
        Thu,  5 Sep 2019 08:42:26 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
        by thoth.se.axis.com (Postfix) with ESMTP id A3ADE421;
        Thu,  5 Sep 2019 08:42:26 +0200 (CEST)
Received: from [10.88.24.4] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
 Microsoft SMTP Server (TLS) id 15.0.1365.1; Thu, 5 Sep 2019 08:42:26 +0200
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
To:     Wolfram Sang <wsa@the-dreams.de>, Bjorn Ardo <bjornar@axis.com>
CC:     <linux-i2c@vger.kernel.org>
References: <1567497091-18270-1-git-send-email-bjorn.ardo@axis.com>
 <20190903174359.GB2171@ninjato>
 <ea04722c-81e5-1fb3-d5fc-0ee24e073025@axis.com> <20190904154814.GC1157@kunai>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <f8629df5-c1b7-aa72-c403-9de393e87a93@axis.com>
Date:   Thu, 5 Sep 2019 08:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904154814.GC1157@kunai>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/4/19 5:48 PM, Wolfram Sang wrote:
>
> I am not sure if this is a behavior that is worth trying to mimic?
> Not yet. We can add this incrementally once we know most EERPOMs behave
> like this. It could be worth adding a comment, though, like:
>
> /*
>   * FIXME: What to do if only 8 bits of a 16 bit address are sent?
>   * The <your vendor & eeprom type> sends only 0xff then. Needs verification
>   * with other EEPROMs, though. We currently use the 8 bit as a valid
>   * address.
>   */
>

The eeprom tested is from ST, model M24C64. Should this be added in the 
code or in some doc folder?


I have another question. I'm considering adding a flag to set the 
virtual eeprom in read-only mode on the i2c side (but writable from the 
sysfs side). Should this be implemented as a separate i2c_device_id, or 
by trying to read som configuration flag from devicetree?


/BA

