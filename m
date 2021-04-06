Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD912355C8A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 21:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbhDFTuJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 15:50:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22923 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234611AbhDFTuJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 15:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617738601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wTzJR7XbmiabDROWf/tRvtql+2pagdo8Q0WmLPBWbq4=;
        b=TpITg+U20MqWENftZ+0nBjaE2HDm80kXqLfrRDZ2Vuj+9rzVv1iA6iuaTrqtLZdFnWhTIk
        uiNQjC8DKZDMN9I9BNyPj+0fuvju9igpgonhCB6QZsZ5mOT8VBCb+FT9BIxtq2zjUcWwHK
        Wqt5yyo2KQ0mfELLkCtr4UR0Vj2u7LI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-UyvVLWn2OB2eU93i82T1SA-1; Tue, 06 Apr 2021 15:49:58 -0400
X-MC-Unique: UyvVLWn2OB2eU93i82T1SA-1
Received: by mail-ej1-f72.google.com with SMTP id zn19so2028231ejb.14
        for <linux-i2c@vger.kernel.org>; Tue, 06 Apr 2021 12:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wTzJR7XbmiabDROWf/tRvtql+2pagdo8Q0WmLPBWbq4=;
        b=FMv0XGqcnZWjLQDm4wb/k3+Vgegj2W8aYeWJsQ//sUJPhESgeSITbSN/H4QXcFapCw
         Pr37CiBq7w8xhijpBkCcKoQaAYVSYeTH2JD9n2ysgM09hQgSuBuicAksX69wXnuKDv/B
         UO0tRYB0qh8jJJPN4CtNplvDl9zN0WSdaIVaquPDfHsgiZqNmB7BlzhQC2kyrbcvDcut
         +WirmnoB4Be7hzBReT31+GCKJXAta9XecsMkHT/Gxc0Zifn/lAmnzaJEhVV3xtNThgqe
         T6hWh9oh9EOLVchFzWaRN0EQkmp2kGgkB/0iglODHAgBo0SbAK9GLGHw38BHvKtHYnJl
         TyRw==
X-Gm-Message-State: AOAM5318Z4SpE0p0d7iwH0xv7P3ggqWMXSc3O1RUACJyTiWgvj8HJmiG
        DFMwzr/rS5eDGlLz14Y2OQ8yB5r44D9pmJvSlo0Yy2gA2ZlkmW7w9vKp51C34TWB7bGZIz4M2m1
        w/G1vREy5nNe9U0ymcPdy
X-Received: by 2002:a17:906:9a48:: with SMTP id aj8mr607447ejc.468.1617738597679;
        Tue, 06 Apr 2021 12:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL1KgXNz1wkNd91JTXhCUZ04j/NggKY8Jpwy3qKfXSHUf+T3424HY/NzfCNDC/sswxM9NLsA==
X-Received: by 2002:a17:906:9a48:: with SMTP id aj8mr607437ejc.468.1617738597561;
        Tue, 06 Apr 2021 12:49:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s7sm6182940ejd.106.2021.04.06.12.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 12:49:57 -0700 (PDT)
Subject: Re: [PATCH 06/12] platform/x86: intel_cht_int33fe_microb: Constify
 the software node
To:     Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-7-heikki.krogerus@linux.intel.com>
 <6d4d44d5-c213-1052-16a6-833a7f01a0ee@redhat.com>
 <20210406194059.GE3122@kunai>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e0266f36-5d9f-4d1b-714c-94e15c1b4d5e@redhat.com>
Date:   Tue, 6 Apr 2021 21:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210406194059.GE3122@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 4/6/21 9:40 PM, Wolfram Sang wrote:
> 
>> What is the plan for merging this patch / this series ?
> 
> I'll take the series via I2C.

Ok, that works for me.

Regards,

Hans

