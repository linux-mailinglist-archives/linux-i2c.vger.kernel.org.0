Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005A11B717D
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 12:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgDXKGr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 06:06:47 -0400
Received: from smtp2.axis.com ([195.60.68.18]:23084 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbgDXKGr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 06:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=510; q=dns/txt; s=axis-central1;
  t=1587722807; x=1619258807;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=WoKs5Og0gerlj6eE3S0a39ru9NWbT0TOBZiuhm7c8HQ=;
  b=WfFHFjpr9AEzrDLkdsOXlVGzxuk9cWVZlHPgSeVzTKUmq1bxo8FFfhee
   fBb3Z8QP6nTHzwZyVi+i5d/m27xXZkzimpxA5uP1pJ60J96JN+U59eyZq
   Ev2c+e/jsoVNv1Y3gIiDwOwxRCMUPt+z8IdhHScN2m6V1eb8JjlaTSIOw
   eDeA/J4Wp/HZ8hq5LsDKrVcWUa8xPEoMabFLN3iBHGPNkcayKLZEGpPig
   88b2WuDk8kLbfuhyDJgM1/x55bhsDE/8eNt8Sj43rybepF5BEqenyman6
   aMvT4b+br6njW/10yVQUPRkdKvg8T0xxDyTzgI85IlPQOkufIojlufmzG
   A==;
IronPort-SDR: 69TvoBs7eMFR2AZgl5S6HzHxhG545ihyS+eLK5ecWyHdgrhPtHtqUC38d4FChwzjWUhCFUTI9E
 u6oI0rp/BV0G51/28ubuuYSTuDeboMKB96KF6jHE4FcX9hHczTqGGvhF3K2ZsC3ZvE5pmcu5Qz
 Jd8GQKf2p/hNN4KFbaF5+45UdcsZqX5dNs5ypS+MPTotLZSzt/CXEtZ9Ri+lpelUZ1Vup6vYar
 LaITfe78aLNdC9mMMjSSENe52Rox6D7cXaWfxRUwD4HregB2ST/VsZJCx++kQwRcd9TpMv5Xfy
 zeA=
X-IronPort-AV: E=Sophos;i="5.73,311,1583190000"; 
   d="scan'208";a="7783874"
Subject: Re: [PATCHv2] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patrick@stwcx.xyz>, <kernel@axis.com>
References: <20200424090443.26316-1-bjorn.ardo@axis.com>
 <20200424100307.GB1959@kunai>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <5180b657-33ff-c182-8a16-82a35a61f647@axis.com>
Date:   Fri, 24 Apr 2020 12:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424100307.GB1959@kunai>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX02.axis.com (10.0.5.16)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 4/24/20 12:03 PM, Wolfram Sang wrote:
> On Fri, Apr 24, 2020 at 11:04:43AM +0200, Björn Ardö wrote:
>> If the slave eeprom has a "firmware-name" in devicetree, then
>> pre-load the data in the eeprom with this file. Otherwise we
>> init the eeprom with 0xFF.
>>
>> Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
> I like it a lot, thanks! Maybe we could add a SoB from Patrick for his
> 0xff-suggestion (but keeping you as the patch author).
>
> Is this okay for everyone?


OK for me!

