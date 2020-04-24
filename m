Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7941B731F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 13:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgDXLbQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 07:31:16 -0400
Received: from smtp2.axis.com ([195.60.68.18]:3713 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbgDXLbP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 07:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=430; q=dns/txt; s=axis-central1;
  t=1587727875; x=1619263875;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ot5Q0giBxowWEbwxAzzYyCSY+h/D/bG3UXD5qUGdW9A=;
  b=WVSzKh0fYVbXdf2T+iYitTwWTA03HUdSe4MxnpLMDc38vrIfG9rYalhy
   R55VTrl+kdqaZIYGfCTq5t/y4wm6hWXHVgyAIbSO2hs3u4KIgTXgVq1eD
   kFVPm1gyDCBMEMHFElIGFgZaUDcP1Q0OXi0DlpefUPCrWNm4TCjKm85gF
   ThMAbUb/8OnSYlFrG2HZMr+awmYbUxIkGvU3rheknnwRTkXa+seTAsFCu
   Oy1U9VWdrIFnbj2CGk+wpORdiC8+TCKews573yNK/CkvHEuu+sGGxLkID
   zZCBYYurVofyzZmdi3BFt0rf2xI+476dgG5Bl5G+kPOYbKPLubBFJlgAw
   g==;
IronPort-SDR: ICzpKZuNol7nYjx5G80qZMBsZB2OnaOjir4QeT4xleVclot0wuGEADpo/FAA0ppw+mViyRLL+6
 lsUjdFQWJnfGeiXVZnWNpseiH4D0XGH0enPU0Fbj//Y3HB68duvhZZ+p11uGBSbDPs9x/W2O8P
 wYniP86nWVgdST9Xq40hm/DTSVhzLTQ6/6xiFfFJMMUEGWnfDmPO7Ds6wAfbaMU8OmaBrmTwZU
 NYtcCw77yd/4UgEpENDriWtOyno9/OiSO8waD19QWcYkMSjy7jm1XddvmO9IXBYwJFOVZYtNSB
 jLI=
X-IronPort-AV: E=Sophos;i="5.73,311,1583190000"; 
   d="scan'208";a="7791947"
Subject: Re: [PATCHv2] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patrick@stwcx.xyz>, <kernel@axis.com>
References: <20200424090443.26316-1-bjorn.ardo@axis.com>
 <20200424111337.GC1959@kunai> <5038e4c1-440b-0a56-978b-a8c9fac061cc@axis.com>
 <20200424112705.GD1959@kunai>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <8d1cd553-4607-4092-7020-911e43e02d11@axis.com>
Date:   Fri, 24 Apr 2020 13:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424112705.GD1959@kunai>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

You got a new patch (ignor the first one, I forgot to update the version 
number).

On 4/24/20 1:27 PM, Wolfram Sang wrote:
>> As I can see in drivers/base/firmware_loader/main.c in function
>> _request_firmware, then the fw will be released internally if it returns an
>> error value.
> Ouch, of course!
>
>>> Also, do we need 'error' and 'ret'? Can't we reuse one of them?
>> Yes, I can fix that.
> Great, thanks!
>
