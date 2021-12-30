Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E27A481F1E
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 19:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241668AbhL3SST (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 13:18:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31868 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237082AbhL3SST (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 13:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640888298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pH+2R47v+iExsDBDUe6RyEHP9seRaqo1jiL4OaIrrAk=;
        b=JK1hlSmd2d9RbIORvjftRSW7Z53MDFUA3HPNPDFYR4h1nooO3V1hDsd8cIe7u8S/37os/p
        +OrGOD7O8nAolJLubZt5oNJRZMChjtIbXvpWYUlXUzujIvgX3ks9Osg+1wXpLLZPTgs8ah
        uvS/G86p/ZOtMZs+l8w6j5ONVC/Kq+I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-3zVu3kNwNgiRDQu7tFaIkA-1; Thu, 30 Dec 2021 13:18:17 -0500
X-MC-Unique: 3zVu3kNwNgiRDQu7tFaIkA-1
Received: by mail-ed1-f71.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso14096403edc.23
        for <linux-i2c@vger.kernel.org>; Thu, 30 Dec 2021 10:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pH+2R47v+iExsDBDUe6RyEHP9seRaqo1jiL4OaIrrAk=;
        b=Q/urKgzbhqogqUOBsqiRA5rTGRPPhnx7JiQDVxW6fclzyjHRPa+mXjKdFPc4hiyPGK
         OEgKAOS8zr5lod1QwGgxGqEcTlAuLfhCtRr+srMYgvJcMUKEChDDTzv3Lp+ZqJJz4Fqj
         FbtW2y9Gf0E3trL5uzNeYkrWmUIZXCur5oJrusn3E93eFt4+lW1lUcGAqYeLK+kL/QzA
         lHsT7+d0J6VaNwVWkzzJG/LZgDEcAYPK0Ei5l1aMlkappYq8Pcd1y5TbceWoQVJL/sVT
         k4WYtuRBKjWBAp2DOYqUYCbD0QohgwdpPnCH9fV+7Vgh9qAZaqaNuN1Ba8m4iqXY+CQ/
         OYdQ==
X-Gm-Message-State: AOAM532XJ4TvejUeKoqBGZSga9XLgy0VtkYCVzX+pxWQeOZH64Qqmi3F
        oI7Uiv+QnrKSlBkmlMR5Gu3jyxzWt2b/fwW17m5ju0mKtVH9eodqJSUjRhA6WRzLPARqbJc/V5p
        ipXIQ2x0LZLCjbOOwi7E0
X-Received: by 2002:a17:907:7211:: with SMTP id dr17mr25517040ejc.204.1640888296325;
        Thu, 30 Dec 2021 10:18:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfg8W3RrTSj9fYYPNWpEmKdYRKNoRR3AfuIv+AskTxMY4+y087J0WJjoWwaAFgwjiSf8Y+qA==
X-Received: by 2002:a17:907:7211:: with SMTP id dr17mr25517027ejc.204.1640888296156;
        Thu, 30 Dec 2021 10:18:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 24sm7789699eje.158.2021.12.30.10.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 10:18:15 -0800 (PST)
Message-ID: <8043413d-c61a-458b-c81f-dd6e98c05b48@redhat.com>
Date:   Thu, 30 Dec 2021 19:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/3] ACPI / x86: Add
 acpi_quirk_skip_[i2c_client|serdev]_enumeration() helpers
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
References: <20211230141722.512395-1-hdegoede@redhat.com>
 <20211230141722.512395-2-hdegoede@redhat.com>
 <CAJZ5v0jw7jNq8FgMFcF9p=YYiuYj=RuV2MTPqGu62QoaG_O1MQ@mail.gmail.com>
 <Yc3ytI/NxnGT0aVf@kunai>
 <CAJZ5v0jyHamePb+J-5JGFPOErzV0Vq1TCD=Yq83hC6eSccCFOg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0jyHamePb+J-5JGFPOErzV0Vq1TCD=Yq83hC6eSccCFOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 12/30/21 19:00, Rafael J. Wysocki wrote:
> On Thu, Dec 30, 2021 at 6:56 PM Wolfram Sang <wsa@kernel.org> wrote:
>>
>> Hi Rafael,
>>
>>> or please let me know if you want me to take this series.
>>
>> Yes, see cover-letter :)
> 
> Oh well.
> 
> I'll take it now, thanks!

Thank you.

I see this in your bleeding-edge branch now. I was wondering what this
means wrt this making it into 5.17, or if you consider this 5.18
material?

Note 5.18 is fine, just wondering (mostly for the timing of merging
the pdx86 side of this, which probably also is more 5.18 material).

Regards,

Hans


