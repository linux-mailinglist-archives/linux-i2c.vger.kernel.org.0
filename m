Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4608C1B3B5A
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Apr 2020 11:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgDVJak (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Apr 2020 05:30:40 -0400
Received: from smtp2.axis.com ([195.60.68.18]:34101 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgDVJak (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Apr 2020 05:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1423; q=dns/txt; s=axis-central1;
  t=1587547839; x=1619083839;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=I6ypXndlL2Ny0cYStbrWZowkeVytwB13UfAFvtcKaEE=;
  b=RlvCeVPoFrnAgSEqyJRIhKKDtL2Ti0dBCUXybziuVV5MwLuZ55gmv905
   bbjtF1+ZBxE9cJuPYiNIAKGO9dTxy20He9EW9MKLnDPCFz23uhDnxC2lk
   fEHgK1Vjeact5ycICzv2C1fq56faeNRhwEYr5rQFLi0FZgOsDB2ay4k6h
   7wRRVZ22+L4v/0isuNLimkUvmVWthjaF15ih2o/hWwVh2XJePbpFVsLEI
   QNi9c80QDg0Dtp1nQrqusPwISMWmdLMQa3TyZBcO3iN9TEvgHpKLa9bNQ
   Jr8iOwxUH+lyLT2Qllelf+a1rnMXqZmUr2y+HM6uNFdVJjYwigVvLz+VY
   g==;
IronPort-SDR: cmYbvcbITUEDft6GZ/WvlPWHGSfQAlAUFPDJy78eARbr2GfSjaquOAO20Aich5sqQo6zdAOrv9
 wBtHoVf4e7CRG8tlAUm5jfLVK8hUYSc2CZsB4l4Rujgh2qAMyuCIU0ZY8JssMnmGXbEJozZr70
 ZejGtNfdLkIOtTFi9VorXpU/fgdeJW2fWyyPqUmla83HXZWAIFeLTc7Cr3owfT93brwbOX0eGA
 MkJ6SwTr+c4A0PGV4+e7AtHIPrfrKeVhVbKRDVfw5ZiI+oChAlatd8VrnuSLTr57/DN2eqRmzH
 dNM=
X-IronPort-AV: E=Sophos;i="5.72,413,1580770800"; 
   d="scan'208";a="7691811"
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
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <47891236-f1df-c130-0bce-d114523880cb@axis.com>
Date:   Wed, 22 Apr 2020 11:30:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421121659.GE1241@ninjato>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/21/20 2:16 PM, Wolfram Sang wrote:
>>> Yes, it might be easiest if he merges your patch (with attribution) into
>>> the else branch of his fw-load patch.
>>>
>> OK, so to summarize, I should update my patch to use
>> device_property_read_string() instead and also init the memory to 0XFF if no
>> file is present. And change name of the function to
> Or something else went wrong.

I did like this now: If device_property_read_string() returns a firmware 
name, I use that, otherwise init to 0xFF. But if it returns a firmware 
name, and for some reason I get an error when trying to load that 
firmware I will not default to 0xFF, but rather fail the probe. The 
logic in that is that if you actively supply a firmware name, you should 
not silently get 0xFF in your eeprom. Does that sound good?


>> i2c_slave_init_eeprom_data.
> Yes, that is my idea. You also need to replace checking for an of_node
> with some equivalent for device properties maybe, but that should be
> easy to find out.

It appears to me that those kind of checks are done inside 
device_property_read_string() so I can just remove them and only look at 
the return value of that function.


>> I will look into that and let you know once I'm done.
> Thank you!
>

I have a patch now working on 4.14, will run some tests on it and then 
try to forward-port to latest kernel och see if it works there as well.


/BA

