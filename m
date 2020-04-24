Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9AC1B7041
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 11:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgDXJG2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 05:06:28 -0400
Received: from smtp1.axis.com ([195.60.68.17]:52410 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbgDXJG2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 05:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=314; q=dns/txt; s=axis-central1;
  t=1587719188; x=1619255188;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=J6E7YmTG2sT7eS3GxnQDXttQr8Fb4dVaRrLrbm3HqlA=;
  b=FLAL/vb4xwHiFSAY0uT8AmyK7gkkCnXRsn/YiHXdeqkr71xj33DAm4KY
   7chjLcgq0bzBQKJe6G3QOd6XNkzgvSb9q+HC9ETkotirV1LQZSLD/YfXK
   ik78elwONAUGMvGiiS9Se/OkaKm+9JDf1J9Wm1XyI8iqxcpNCkyD96Jh5
   UDGR2vc/V/9HfY0073EjvrQ2rnQkCq5IydSuWC/3Bbn9o/lsN59Uj5s7i
   Doy2s5HUL07qseXVS2luDEWyePSsHo0PyFFyWLuYHwlGpH4iZeD6E3gOI
   9eu5X/PRrg5TWOiYv3Nlkpitms6fBOWhWCKcm/P6vwptISEMAp/ysmu+f
   w==;
IronPort-SDR: I8K4ijnB0wEjXfdbxCL3WMZYXsqX9W1S7+aAVZFEyhbxArHuhstLzhb5rG5S2xa4g2qqACcQ/6
 ysXn+ZUhT1TpmYFsbq2uE0Z6EWZezzA/VFfJEuba82pbV4/kRnqqm7TFyYgVcnnLgh8/HMMLpK
 kBzeVxubV/6Pf08Ao4JxplGdC0/eH1CPmpQHYFvMGC6yxYW3rCtkHCzyxiLR9WyDoX5pQLG+74
 me33aZq54Fngj5cAnKsm8BhR18vlNWEgUdbFNxVd8WjJMn2hj2D6jyKlWfBUQB6Bmw6+btmauK
 vbA=
X-IronPort-AV: E=Sophos;i="5.73,311,1583190000"; 
   d="scan'208";a="7992578"
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Patrick Williams <patrick@stwcx.xyz>,
        =?UTF-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
 <20200420164349.GD3721@ninjato>
 <20200420203146.GC95151@heinlein.lan.stwcx.xyz>
 <20200420205325.GA1693@ninjato>
 <adb03545-88db-689c-dbf7-9f746236adb4@axis.com>
 <20200421121659.GE1241@ninjato>
 <47891236-f1df-c130-0bce-d114523880cb@axis.com>
 <20200422093642.GA1245@ninjato>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <afc8071b-2f70-c46d-fabd-f5a016126e04@axis.com>
Date:   Fri, 24 Apr 2020 11:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422093642.GA1245@ninjato>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX02.axis.com (10.0.5.16)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/22/20 11:36 AM, Wolfram Sang wrote:
>> I have a patch now working on 4.14, will run some tests on it and then try
>> to forward-port to latest kernel och see if it works there as well.
> Looking forward to it. I will look at it right away then!
>

Patch tested on latest kernel and submitted.


/BA

