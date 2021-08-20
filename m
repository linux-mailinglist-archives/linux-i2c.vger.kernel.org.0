Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032A23F2BBA
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Aug 2021 14:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbhHTMIU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Aug 2021 08:08:20 -0400
Received: from smtp2.axis.com ([195.60.68.18]:12045 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237764AbhHTMIT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Aug 2021 08:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629461262;
  x=1660997262;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=Skn8l/KAe/gVRzGAKHerLg/Y/96MtL6BmS2eNxFkGLI=;
  b=aIFD74WW9aL+/6uYxoJo6EUPSIqlg9dprbmKz9mfrIISh+maym1kfluf
   BRLmvpiqbWr9W2D0lLDSrxTOSFjWEtjNLOfRnOMt6cYg3u15gz9bxwl9n
   ihRDmfIOoyyI87hbDtgV14tLd2+s+FHl4PRXw3r+DcA3fwd5z/kq8vhu2
   OYd4LkV8QHZVehcnIce9JHb/NBNcIArIo1nPGbUZ6FXkAcd2wHtjYZRkK
   /M6+HWD1pu6qUsItXw3vEfCoV6vf4LBdTDBaZEUK7Psgeh2kyRJU0IESH
   cpNHD6BEU62yeGhuZjpImUydjp+PBMLIZVbm0C0vhyeSbc6d6wR+LoEpD
   g==;
Subject: Re: [PATCH] i2c: slave-eeprom: add an of_match_table
To:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <kernel@axis.com>
References: <20210504135209.4757-1-bjorn.ardo@axis.com>
 <YNcCFxzGVkTQMs/x@kunai>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <137dba33-6393-0c8a-e19a-c67d948e5ab4@axis.com>
Date:   Fri, 20 Aug 2021 14:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YNcCFxzGVkTQMs/x@kunai>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail06w.axis.com (10.20.40.12) To se-mail04w.axis.com
 (10.20.40.10)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,


This is missing for the entire module, so maybe then it should be added 
for the existing DT-API as a separate patch and then this patch can just 
add the things it is actually adding to the API? Or do you think it 
should be included here?


/BA

On 6/26/21 12:31 PM, Wolfram Sang wrote:
> On Tue, May 04, 2021 at 03:52:09PM +0200, Björn Ardö wrote:
>> This is needed since commit af503716ac14 ("i2c: core: report OF style
>> module alias for devices registered via OF").
>>
>> Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
> I'm afraid we need a YAML file, too. checkpatch says:
>
> WARNING: DT compatible string "linux,slave-24c02" appears un-documented -- check ./Documentation/devicetree/bindings/
>
