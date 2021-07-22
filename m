Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB2C3D2D13
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 22:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhGVTWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 15:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhGVTWN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jul 2021 15:22:13 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961A4C061575
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 13:02:46 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id j6-20020a05600c1906b029023e8d74d693so317470wmq.3
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Om1av9l9/TQSzFgvYxMyJaYQ69AM7K+jqLuYuGc/VRQ=;
        b=XqChAMSLHuI1+j/jMSupl9zxD3lXEIHbsRaiJxrkCWqwpa6agTagxbEOsUeiMN92B5
         6d+namYLNxwMV/YMzvxJQRj+F5tmGjPTm09wTRrp2Y2l0Q2ZvZWK8dYh97ta5jVnSsAe
         w8UvUMQcxQ40nghZJrH0UTLFRCiKC4iI4UoRRNBTEMYWlawbgIdVuyI6NYfZEUZvfj2y
         s3x2NPDK42ig5nexeMSPb0j0CQBfUb9GeeDeFFXq/mtASvYVG81HuRB8fPnA8d19QW4Y
         lWihI8qXROl4rdVgDmUa/KQDyWY+IKFA9lx191lnamChm3z5LvSe5rpbLEJl+aDWZcVx
         5oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Om1av9l9/TQSzFgvYxMyJaYQ69AM7K+jqLuYuGc/VRQ=;
        b=rm6K7KS0K+mXSNozFc065d5qN3e3H/mvwC76QZXnVafKH/tuleqTOpGLon+cMMCGnj
         JMvbcz/9+qHLWxfu7LxPaijWTvVbUorGyhKh65CWvIpPwt7rRD9x57DcdArpPvCK0GOd
         kDWz1WMde6M5WxJ9Q3vK/7TwOIDXZnaiY/1I5LGndrlV3Nm558OHpS7wiix+VG8J1M1D
         1dBZ4hXmrjFmNWmuD9nzPWEM8JW+Ifg+PF+7kNt1ur2ak4tKoEzBeOmSDFTpL9rnOUtm
         DQlO+pAoGBcIZjP3bCSRIWYUfRt4hNGtuafI40kCTos2RWss7fJM4YQxd1B6P5cpBZDS
         gLyQ==
X-Gm-Message-State: AOAM532cwsvDQrn5RYxllWVeC9ZMjICEPUlp/lvfp+0J1r7rdLNNwK/l
        G66rbcHNcPwuuBoSvWOXg0yG4UI05bU=
X-Google-Smtp-Source: ABdhPJyhbBPU+tRsdsCT5hoXO48D9ZZfPDy1fUnt0LcADaFIKJkPArX3JUV6zbMVT/QYajruA+TTng==
X-Received: by 2002:a1c:1bd4:: with SMTP id b203mr10946015wmb.171.1626984164974;
        Thu, 22 Jul 2021 13:02:44 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f3f:3d00:5025:6a08:c954:44d4? (p200300ea8f3f3d0050256a08c95444d4.dip0.t-ipconnect.de. [2003:ea:8f3f:3d00:5025:6a08:c954:44d4])
        by smtp.googlemail.com with ESMTPSA id j12sm31616630wrq.83.2021.07.22.13.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 13:02:44 -0700 (PDT)
Subject: Re: [PATCH] i2c: i801: Fix handling SMBHSTCNT_PEC_EN
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <15db81d0-ddbd-b590-3996-51e588c5b10a@gmail.com>
 <20210721144620.00671c3d@endymion> <20210722103433.6c81c6b2@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <bbcd6fe5-cb8d-1b85-7c1b-5ac57695f6f7@gmail.com>
Date:   Thu, 22 Jul 2021 22:02:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722103433.6c81c6b2@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22.07.2021 10:34, Jean Delvare wrote:
> On Wed, 21 Jul 2021 14:46:20 +0200, Jean Delvare wrote:
>> As for testing, I also don't have a PEC-cable device at hand. However,
>> we may still be able to test this change:
>> * If you have a device at 0x69 on the i801 SMBus of any of your system,
>>   that would be a clock device, which almost always support PEC.
>> * If you have EEPROMs on your i801 SMBus, you may be lucky and find a
>>   sequence of bytes where the PEC computation leads to exactly the
>>   value of the following byte. I remember doing that years ago, sadly I
>>   can no longer find the script I wrote at that time. Be careful when
>>   accessing SPD EEPROMs, you want to read from them, not write to them
>>   ;-) Incidentally i2c-tools was just improved to allow arbitrary SMBus
>>   block read commands so i2cget can be used for easy testing from
>>   user-space.
> 
> Well, what I wrote above wasn't accurate (bad memory I suppose). While
> SMBus Block Read commands are OK to test the clock devices at 0x69,
> they are not the best choice to poke a read-only EEPROM, as the first
> byte will be interpreted as the block length, and if it is not between
> 1 and 32, it is invalid and the transaction will fail, regardless of
> PEC. Which in turn dramatically decreases the chances that at least one
> offset in your EEPROM will work and be usable for testing purposes.
> 
> Furthermore, i2cget has a safety to prevent you from messing up with
> your SPD EEPROMs, that will deny using PEC at all in the I2C address
> range 0x50-0x57. Which is exactly what I was suggesting to do. So I had
> to recompile i2cget without the safety in order to preform my tests. To
> be honest I think the safety is overkill (as far as I can see PEC would
> only trash data in "c" mode so we could limit the safety to that mode)
> but my testing being clearly a protocol abuse, I'm fine with having to
> modify the source code to do it.
> 
> Anyway, for the record, my hackish testing protocol is as follows:
> 
> # rmmod at24
> # modprobe i2c-dev
> # for i in `seq 0 254` ; do echo $i ; ./tools/i2cget -y 4 0x50 $i bp ; sleep 1 ; done
> 
> Then I basically look at commands failing (on PEC error), until I am
> lucky enough that the next byte in the EEPROM matches the expected PEC
> value. I had 2 such offsets on my first SPD EEPROM (82 and 163).
> Meaning that I was able to test your patch and I can confirm that it
> works OK (testing limited to the 8 Series/C220 Series [8086:8c22]
> device and SMBus Read Byte transactions, but I have no reason to
> believe other devices or other transaction types would behave
> differently).
> 
> Tested-by: Jean Delvare <jdelvare@suse.de>
> 
Thanks for the comprehensive explanation, Jean.
Now that you added your Tested-by: Would you prefer that I send a v2 that
incorporates your two smaller comments? Or is it ok as-is?
