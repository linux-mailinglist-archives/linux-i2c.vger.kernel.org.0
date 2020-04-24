Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B02A1B72FA
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 13:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgDXLWR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 07:22:17 -0400
Received: from smtp1.axis.com ([195.60.68.17]:25426 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbgDXLWR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 07:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=534; q=dns/txt; s=axis-central1;
  t=1587727337; x=1619263337;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=jLbwp4z2a8ywYtIlNFO6bEPpuvqBJMQUIkngUPj6OKQ=;
  b=PhgTcim1dlGSCJLMLVJryO28X9eb9CMFEABgTbGmT8+O12yg6Y8uFP04
   h0H134e15+vhYPBwbzk36YjiDj/6wKRb12I5SVDNXv0ddjM7Okff/3uoX
   UaycZykOWDsKmxREz1noMa43QNQO8XpVMBJcZQyVx5Nq6Y3PPVRza2K/5
   tsCD7QM5/jNyglUr6a2AYVIapyEoIxeARIWphEE5bjDuqlFrUZSTd6W8N
   Y6ZxVLELxUsFgNSGSvsubTWmhrbBhQBHcZ6hmfX4jXSeGb95DvjVZkk7C
   nzUBJA0SGNHmz2yZ3lx0KWW33Ps4NNZVe35wXtaFy012gxzUzfh9Vaf/L
   Q==;
IronPort-SDR: Mczf+wSEy9tXf4x1FqTOMvRi/WpV2jaYEX5zFbFC1ZTCtx6+CsBKXBbTeqEaeW0IN++enSIaV9
 LcHDwJDfVVX4SBoh72YG+Jokyo5YpwidvKEREb6BHHUl2aRfocorIVFoDKof9lYs+5uQlpkA1D
 dISFs6e9UX6Vv0bU1r8VPxKhe9styPW5i+3DLKx2h9A3WYPd0YXsBvq1qT+LJLAeQjTEecmZN8
 9kVwYnOqULEl7TzSgReQvTLuRiEaFbXDLObOGL6665P/JfiTzGn8TuLra70qekGpkTIhYMFDTL
 mwc=
X-IronPort-AV: E=Sophos;i="5.73,311,1583190000"; 
   d="scan'208";a="8007496"
Subject: Re: [PATCHv2] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patrick@stwcx.xyz>, <kernel@axis.com>
References: <20200424090443.26316-1-bjorn.ardo@axis.com>
 <20200424111337.GC1959@kunai>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <5038e4c1-440b-0a56-978b-a8c9fac061cc@axis.com>
Date:   Fri, 24 Apr 2020 13:22:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424111337.GC1959@kunai>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/24/20 1:13 PM, Wolfram Sang wrote:

> On second look, two questions:
>
>> +	if (!error) {
>> +		int ret = request_firmware_into_buf(&fw, eeprom_data, &client->dev,
>> +						    eeprom->buffer, size);
>> +		if (ret)
>> +			return ret;
> Aren't we leaking 'fw' here?


As I can see in drivers/base/firmware_loader/main.c in function 
_request_firmware, then the fw will be released internally if it returns 
an error value.


> Also, do we need 'error' and 'ret'? Can't we reuse one of them?


Yes, I can fix that.


/BA

