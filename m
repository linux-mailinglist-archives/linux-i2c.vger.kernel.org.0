Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED94014152
	for <lists+linux-i2c@lfdr.de>; Sun,  5 May 2019 19:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfEERNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 May 2019 13:13:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33755 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfEERNh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 May 2019 13:13:37 -0400
Received: by mail-pg1-f194.google.com with SMTP id k19so5257267pgh.0
        for <linux-i2c@vger.kernel.org>; Sun, 05 May 2019 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YNmDD8vtagiaoWkJ+1sS8C3SA5OGR9JrtxNHXm1mx+4=;
        b=gYzemmNtZ0PrOWiemds+L3Xp4uIzswzDbUF6iqBhpBpHVg6le5s2tl6/VS1Kp5Eu2F
         jSNB+AjOWc5rK3yij0BOirJRW3+gBDjX2EvGS6mLRmEiyWISvvaltDmaa/+IBagRAEMv
         wEZPMbw8sWVsDqGHu+uGfbF8wUe30xOfjlQn7yys7FvfuqGdhlFcZC80SAAh+CHYyhSO
         zShtrg5CVrREyxDkN3XHk6KtuZAucAo0tqIdJFTzCOTPYYm8H70rvawRn5j5xuQEcoUk
         K7APZWBzyW9aaFQ/vREga4xgrL1XxZhiFRtd1JHqb+GHF5mEBOOHBzZuueeApZ+YlHPs
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YNmDD8vtagiaoWkJ+1sS8C3SA5OGR9JrtxNHXm1mx+4=;
        b=MzFlwAL57ht+iAg1vUW+o/ShamQi6nmbeb9FGgmsXFcWPQB5qX/Jsol6aJF/cXPrcN
         YMeCyj6mVa6ZxiVom19EzaJWb6Ne38jryeMbP3iRDwAbx9dqX8kcZvjZErWn1Kmarp3x
         daUUpJ/CrA/OXNiNasqjWvGworsmdhWmqthBVHblZ6fCs6hLipfETvVvZPkQK1rCg1Ps
         6J7vBm5xUkWJRPvYaZgJh+81RMJiPbcLcMpolHLeGNFqcguwf2ySiaqB/av4FvjVdykd
         COSDwWjlRYHZHtcQbpfWR33l7D1rtrSUvqXUVlcXrms9QP1XyqIuSKuHHDV5RORui36C
         0L5A==
X-Gm-Message-State: APjAAAUF6L9DhRYVpPIh07hoKv0EvCxTPSwZiYYrY/eaxlODUlddSXfA
        CoZLzAavaFzHbCMRq+jJyOuRw917
X-Google-Smtp-Source: APXvYqy9p8dSPEvM4hzF95R0FFtyo1rxhCi/zRvOgWjUjsYDlRh+llaumBgNmxKX4rqv6rftV5bR8A==
X-Received: by 2002:a65:4006:: with SMTP id f6mr9748488pgp.47.1557076417016;
        Sun, 05 May 2019 10:13:37 -0700 (PDT)
Received: from [192.168.1.3] (ip68-101-123-102.oc.oc.cox.net. [68.101.123.102])
        by smtp.gmail.com with ESMTPSA id i3sm9575630pgl.57.2019.05.05.10.13.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 10:13:36 -0700 (PDT)
Subject: Re: [PATCH] i2c: bcm2835: Model Divider in CCF
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Annaliese McDermond <nh6z@nh6z.net>, eric@anholt.net,
        wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     team@nwdigitalradio.com
References: <20190505034339.30778-1-nh6z@nh6z.net>
 <610c7594-85c9-72db-63a6-6e632e9586aa@i2se.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <c43eb848-23cd-4b0c-638d-3bb0df58ed31@gmail.com>
Date:   Sun, 5 May 2019 10:13:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <610c7594-85c9-72db-63a6-6e632e9586aa@i2se.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/5/2019 3:36 AM, Stefan Wahren wrote:
> Hi Annaliese,
> 
> Am 05.05.19 um 05:43 schrieb Annaliese McDermond:
>> Model the I2C bus clock divider as a part of the Core Clock Framework.
>> Primarily this removes the clk_get_rate() call from each transfer.
>> This call causes problems for slave drivers that themselves have
>> internal clock components that are controlled by an I2C interface.
>> When the slave's internal clock component is prepared, the prepare
>> lock is obtained, and it makes calls to the I2C subsystem to
>> command the hardware to activate the clock.  In order to perform
>> the I2C transfer, this driver sets the divider, which requires
>> it to get the parent clock rate, which it does with clk_get_rate().
>> Unfortunately, this function will try to take the clock prepare
>> lock, which is already held by the slave's internal clock calls
>> creating a deadlock.
> 
> i think i understand the problem, but could you please explain the
> specific use case where this happend?
> 
> I suspect bcm2835 is not the only platform which is affected, so it
> would be better to fix this in general.

Agreed, if you could identify i2c bus drivers that support changing the
bus clock and move the registration of the bus 'struct clk' into the i2c
core that would scale a lot better.
-- 
Florian
