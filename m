Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8793628D170
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 17:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbgJMPp6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 11:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46038 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727830AbgJMPp5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Oct 2020 11:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602603956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CVL6suc3bCYXCeTxwyDVXkvvDs+rPcToK4ihASqFKPA=;
        b=BYniBPlA7660QkLKzZyjkvukksKvi/MV5iAzA1Ii+iG62ZmsBjojHvUUs1ECAGhYNeG31r
        K+s7y9jTRcyHjycLkyZUH/OFNdEBhBQCrhj9mnj1SAU7Nfae6efHe0dN/f6+5nviF26Rf0
        6gpeD3DxZvULTvfGugrjNFRlJHWxDgU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-2_RkSDXsPrukeQoge12AAQ-1; Tue, 13 Oct 2020 11:45:53 -0400
X-MC-Unique: 2_RkSDXsPrukeQoge12AAQ-1
Received: by mail-ed1-f70.google.com with SMTP id o24so21787edz.11
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CVL6suc3bCYXCeTxwyDVXkvvDs+rPcToK4ihASqFKPA=;
        b=cLU6Ny7OrHHgiZy+OQwFiYdKpcKdx2T/nQagXHIbmEvUXsHSLQOWbnTTN6Bv0Fjh92
         sxCEWIO266qdsnnEUV4YO09PInLzQyUgN9w3xQ2hILI2FtpBIMsyQdzUAeY2+r8E2Uid
         kqB39oAT6qwRLNgxdkq7RaMjSOyXEfvGUVJZyUI34ny9OUYZ5WZ3/4wa7LBTvcMw3dUM
         uryT2JhotmMsYrbOozV4poiUuOPAVEom8Hys6vSnyZEn2xMQG+M2u+VdCHIrf0IdWoT2
         rliSEBkkDvyeN8ldrEl3tAHZWUlNUIt6YdLxuk+27WzBCZyutR5JUj2L0Lwxai97X4lF
         vg+A==
X-Gm-Message-State: AOAM532+fXJiKtZ42AcGbFGia2GaP3nLNLvlf+0lb0fXxAP/IQcfsGEW
        GyA+qtImgt0pscVSx479gVmc7Fny6xU6aJ1+znVGznpJ5LEWm3ih0OwfBrAhFtaX1YIFD9nLzPX
        IJ+QqehGrcrahZcjGB8TB
X-Received: by 2002:a17:907:9ef:: with SMTP id ce15mr366354ejc.430.1602603952006;
        Tue, 13 Oct 2020 08:45:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyajKajYRMHQdAu5fbqEKcfd+zyIp/zEg7r3nLOT+/4tCMfRvyZyJNocQVTFgOxL4gd/c0Qqg==
X-Received: by 2002:a17:907:9ef:: with SMTP id ce15mr366326ejc.430.1602603951693;
        Tue, 13 Oct 2020 08:45:51 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id m9sm194656ejl.45.2020.10.13.08.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 08:45:49 -0700 (PDT)
Subject: Re: [Bug 209627] Touchscreen doesn't work anymore since commit
 21653a4181ff292480599dad996a2b759ccf050f (regression)
To:     Rainer Finke <rainer@finke.cc>, linux-i2c@vger.kernel.org
Cc:     mika.westerberg@linux.intel.com, wsa@kernel.org, sashal@kernel.org
References: <ab71ef62-64c8-ff31-c5aa-43ad454d1143@finke.cc>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cb544a8b-98e8-2f43-4984-bc0422a05703@redhat.com>
Date:   Tue, 13 Oct 2020 17:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ab71ef62-64c8-ff31-c5aa-43ad454d1143@finke.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/12/20 9:52 PM, Rainer Finke wrote:
> After upgrading from Linux 5.4.68 to Linux 5.4.69, the touchscreen of my Huawei Matebook 12 doesn't work anymore. The same issue happens with Linux >= 5.8.13.
> 
> I've compiled Linux from git to verify if it was fixed, but it doesn't help. But when reverting the commit 21653a4181ff292480599dad996a2b759ccf050f the touchscreen works fine again.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.8.13&id=953fc770d069b167266d9d9ccfef0455fcfdc070
> 
> For reference my bug reports:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=209627
> 
> https://bugs.archlinux.org/task/68178#comment193400
> 
> 
> Hardware:
> 
> - CPU Intel Core m3-6Y30
> 
> - GPU Intel Graphics 515

Thank you for your bug report and I'm sorry to hear about this problem.

The commit in question fixes the touchpad not working on several
recent Lenovo models. What it does it makes the method (opregion) to
access the i2c bus from ACPI code available to the ACPI code before
calling the status method of ACPI devices on that i2c-bus.
This status method tells us if the device is actually present or not
and on those Thinkpads the status method did an i2c check, so we
needed to register the i2c opregion before checking for new devices.

Registering the i2c opregion earlier seemed like an obvious
solution, but I was already afraid we would hit an issue on some
device because of this, because of ACPI being ACPI.

It seems that the ACPI status method for your device probably
also does something with the i2c bus when the i2c opregion
is available, but for some reason that is not working...

The next step in debugging this would be to take a look at
the ACPI tables for your device, can you please run:

sudo acpidump -o acpidump.Huawei-Matebook-12

And then send out an email with the generated
acpidump.Huawei-Matebook-12 file attached?

Note please drop the list from the Cc when sending the
email with the attachment.

What would also be useful (for a possible workaround) would
be the output of:

grep . /sys/class/dmi/id/* 2> /dev/null

Please run this as a normal user (*) and copy and paste
the output into your next email.

Regards,

Hans



*) this will exclude serialnumbers for your device which
are only readable by root


