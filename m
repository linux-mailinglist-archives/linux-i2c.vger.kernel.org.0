Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4369B1537B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 20:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfEFSOS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 14:14:18 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45704 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfEFSOS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 14:14:18 -0400
Received: by mail-io1-f65.google.com with SMTP id b3so6224630iob.12
        for <linux-i2c@vger.kernel.org>; Mon, 06 May 2019 11:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=bi1X8E2iJDbOTLkAMJo/IBi1WYDSDyokTPbiJ53Ivxs=;
        b=TJRCGKtEXJDmSGGyA07GXyq5cu9+tq3LBaNSRxUT0BZZDVFM4LmrCmly/KfJo84I5Z
         3auKvn5kVMlG32tq7aHcagk45FMqrBYza/Oa9XxyvV7ozMKX8cASX53o8SHr2ccIUDmD
         pUk3zaZhy4m5wrR6xFY3/mEHVvkOvddzct5hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=bi1X8E2iJDbOTLkAMJo/IBi1WYDSDyokTPbiJ53Ivxs=;
        b=XmOsb9GUASQuCNB3R2ObM/3y36M+C/c5I6TM+LIdKXAP75Yzm1dAxpTZRhkBC3hrui
         3oa9n/qWU3iKul7kho1lSE2xZFYYbRgZVNPZ/HEZ6xRuJccAy8495SLpGYN37iOIPU6s
         JTsk8O+rbv/ACP4siz9ukH5PM5ZIRkIoX3V6xSVVJnYvj5Uj554xJEyk6YJ39cPB5y3v
         D4tHByZXUePhgh8jXALXQgvJyjOfkADFvPWMYcm0aOqB1cR14PX2+8foH/vzuToLhJx+
         sU8BhV9MEVpYVcXzGk0hjb20JV2Atzu1meiNs/YVcC2YxIruTKQ6NCzuT6bZ0lXt5ui3
         RmIg==
X-Gm-Message-State: APjAAAWrW/XIrMOTo3g8E5g8VWgIVYxGdKmLxEmLp/bhs26GDCONL4ut
        oNtS2H7wkPU08qZPR62l+9XGTw==
X-Google-Smtp-Source: APXvYqxmH1MfnNyv9pTsAAZjt8KEU+PLQD878IbPuF3Kcy0xI+f0xrPj83IaLJSfaeDvvPIweCR+EQ==
X-Received: by 2002:a6b:8ec4:: with SMTP id q187mr11218439iod.280.1557166457616;
        Mon, 06 May 2019 11:14:17 -0700 (PDT)
Received: from localhost (50-46-216-15.evrt.wa.frontiernet.net. [50.46.216.15])
        by smtp.gmail.com with ESMTPSA id d133sm5546120ita.5.2019.05.06.11.14.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 11:14:16 -0700 (PDT)
References: <20190505220524.37266-3-ruslan@babayev.com> <20190506045951.GB2895@lahna.fi.intel.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Ruslan Babayev <ruslan@babayev.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Ruslan Babayev <ruslan@babayev.com>, linux@armlinux.org.uk,
        andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        wsa@the-dreams.de, davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, xe-linux-external@cisco.com
Subject: Re: [PATCH net-next 2/2] net: phy: sfp: enable i2c-bus detection on ACPI based systems
In-reply-to: <20190506045951.GB2895@lahna.fi.intel.com>
Date:   Mon, 06 May 2019 11:14:15 -0700
Message-ID: <871s1bv4aw.fsf@babayev.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Mika Westerberg writes:

> On Sun, May 05, 2019 at 03:05:23PM -0700, Ruslan Babayev wrote:
>> Lookup I2C adapter using the "i2c-bus" device property on ACPI based
>> systems similar to how it's done with DT.
>> 
>> An example DSD describing an SFP on an ACPI based system:
>> 
>> Device (SFP0)
>> {
>>     Name (_HID, "PRP0001")
>>     Name (_DSD, Package ()
>>     {
>>         ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>>         Package () {
>>             Package () { "compatible", "sff,sfp" },
>>             Package () { "i2c-bus", \_SB.PCI0.RP01.I2C.MUX.CH0 },
>
> Hmm, ACPI has I2cSerialBusV2() resource for this purpose. Why you are not
> using that?

I am not an ACPI expert, but my understanding is I2cSerialBusV2() is
used for slave connections. I am trying to reference an I2C controller
here.
