Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1744190C11
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 12:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgCXLMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 07:12:19 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35665 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbgCXLMT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Mar 2020 07:12:19 -0400
Received: from mail-pg1-f197.google.com ([209.85.215.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jGhTl-00042R-Q4
        for linux-i2c@vger.kernel.org; Tue, 24 Mar 2020 11:12:17 +0000
Received: by mail-pg1-f197.google.com with SMTP id p13so13266115pgk.18
        for <linux-i2c@vger.kernel.org>; Tue, 24 Mar 2020 04:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=dELJVRYxlGhu9i4AEGE2L20IBZeNNSP6rwQj75nRA8o=;
        b=e/tbxtHLL+I5vqtcIm4/j7FpNljbx5NE4eUZEKnvdsjuEAXcgaJXAKBcBixwdrs/lq
         IOpo9ndLUCOFlCQadzmOBa/8WWIbMkhZ4teveHF8w8IKSOcX/j8MTvcPn8WzHNOevXAt
         rnGpdkx5cVKGZ/xuUGRQC1jG7sjHTBEe2ZvsEbab6mpen9Chfol/B7As038V9zryr1T4
         J77Bt4G0tCnttTd7mS6zpaCTrr0DSBVIqt1kczd5MEmiyOQFH1G4gqGw8VYFprwHx4Du
         avX1oFzFnXnx9ogLggGG/FZRNLiJv4jXmAkCHLM5mbft4c4RHz5BozoWCO41J+zeNWBd
         T8Zw==
X-Gm-Message-State: ANhLgQ3WBmItxirgLJ8kUbkb8RRjt5giqDRAnFTYkjcrBMpl9bWMffcL
        88XBdpIHw7hj92tINWP1C+3s6cZC/0ebhwjxx/9/XsL78YmvR5Kl4ygwXQWfOdwr8xckto8SEOO
        XZwa15J5rxOQkiLXhoCDwtSbVMxzR413czY6+SQ==
X-Received: by 2002:a17:902:7c93:: with SMTP id y19mr25768293pll.205.1585048336453;
        Tue, 24 Mar 2020 04:12:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuuc7MjGY+CwC3+ErOa9ylgdy79ZtRmDNqn9BMbHQ5gvDNiWd72hPuEejlqGyNqoohZeL72nQ==
X-Received: by 2002:a17:902:7c93:: with SMTP id y19mr25768263pll.205.1585048336044;
        Tue, 24 Mar 2020 04:12:16 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id z12sm17044363pfj.144.2020.03.24.04.12.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2020 04:12:15 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200324110930.GH1134@ninjato>
Date:   Tue, 24 Mar 2020 19:12:13 +0800
Cc:     ajayg@nvidia.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <9771BC92-1785-4E9A-81C7-E72C2C65CE22@canonical.com>
References: <20200311165806.12365-1-kai.heng.feng@canonical.com>
 <20200324110930.GH1134@ninjato>
To:     Wolfram Sang <wsa@the-dreams.de>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> On Mar 24, 2020, at 19:09, Wolfram Sang <wsa@the-dreams.de> wrote:
> 
> 
>> 	} while (time_is_after_jiffies(target));
>> 
>> -	if (time_is_before_jiffies(target)) {
>> +	if (time_is_before_eq_jiffies(target)) {
> 
> While unlikely, there is a tiny race between the time_is_* calls,
> jiffies could update inbetween them.
> 
> So, for the sake of good programming practice, I'd recommend to set a
> flag in the do_while-loop and the have the logic above solely based on
> the flag.
> 

Ok, I'll send a v2 based on your suggestion.

Kai-Heng

