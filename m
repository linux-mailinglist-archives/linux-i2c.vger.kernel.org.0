Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044422308A6
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 13:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgG1L1f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 07:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729035AbgG1L1d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 07:27:33 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CE5C061794
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 04:27:33 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id b9so9740278plx.6
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 04:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=SRHIEySNQYK2z0Z/rAUnO7yAi7/FpNXOnummipu9+MA=;
        b=QlX05NjOVSLXKehXA1sUvw7om53HKPayf2VvQCkl9pwKOoPYAowHXstpZCKqTeDxeL
         PG3QmzeEwS2/FBo3YVKR0rwNIMGBaB3jYTgFDFWpIsGQMbImBg4Q+gK7J3NlBB/790gm
         24wnewv6xcRTZB0CYI+Ya84QJc7of0Qr1Gz36L+kjGgej8cn5UUiUfCvOEf9ek/7X1IT
         sm1rMASI/OikhdmEl2rie8GESk/b171Kjll/PdIMlZFNsN1WMTBrF8qBlcUMQRTBwJKa
         1k8qoYMhmGs+mMM9peYoU0vZ5e3GdqAjiyBAkJ9RYTdYir7OS1WcNE1ZCv4M3gXqaoz8
         dgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=SRHIEySNQYK2z0Z/rAUnO7yAi7/FpNXOnummipu9+MA=;
        b=pPuEscU7HTwjWi6+NtdWXKJ1wzrhd06JBrEm043cQKNh1rbK1MUG8EN7DH/+7dCkyL
         OxoWjH5CrUr/pX7MFY1wAoXjHC15fTUyEnzEwJ3XcmLLHqdve4FliPCsMHxnLUU9QBAg
         xvy5MJGEnso9VW5EG39EFwhvExH9AmkD4zO2tEDkQ8ykMkXTrjY2Q314mJZ79ajyRmeJ
         HCh5Z9sAxdcNR/36GaNMC/Q1bYqQr5wvlisUbZ9ZmXGf/Ce9C6GXtSzMLV3ZK9QTLwVz
         3pI6+Y1pOgMpZy1zpuC5OrpmQZaG0IqWjX+NeCZVLAq2G7LqFUX/bAAY+KUqOz3fB4U7
         AjvA==
X-Gm-Message-State: AOAM531YHMmmvKP7qYsVxo2/DalrheZ0pS4zLNnWQAE/jz3jLkuAyrgS
        4OBGeFjZotv1+5MCdX0Kg0g=
X-Google-Smtp-Source: ABdhPJz7fNpUMqBe5ZgQd1HRM+ODNs5BhNPJN/0U+goECHOx1jLEck3HUvUC8Wl5l3CPz60yKfPDAw==
X-Received: by 2002:a17:90a:1f87:: with SMTP id x7mr4057558pja.101.1595935652877;
        Tue, 28 Jul 2020 04:27:32 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id d2sm2189044pgp.17.2020.07.28.04.27.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:27:32 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <20200728103609.GB980@ninjato>
Date:   Tue, 28 Jul 2020 04:27:30 -0700
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <5AA89168-FF62-4269-912B-A669664F60B9@gmail.com>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
 <20200728094037.GA980@ninjato>
 <88D24A81-513C-4CA2-9AC8-FB156E992F34@gmail.com>
 <20200728103609.GB980@ninjato>
To:     Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Jul 28, 2020, at 3:36 AM, Wolfram Sang <wsa@kernel.org> wrote:
>=20
>=20
>>> I thought about this, too, and wondered if this isn't a size =
regression
>>> in userspace with every i2c_smbus_data getting 8 times the size? But
>>> maybe it is worth if backwards compatibility is maintained in an
>>> otherwise not so intrusive manner? Jean, what do you think?
>>=20
>> Yep, exactly. It just made for a nice drop-in replacement for me to
>> focus on i2c-dev.c first.
>>=20
>> A lot of clients will stack-allocate these. I suppose i2-tools =
doesn=E2=80=99t
>> load more than one at a time, but haven=E2=80=99t looked.
>=20
> I just checked all in-kernel users and i2c-tools. Never more than one.
> Which is kind of expected because you usually re-use i2c_smbus_data =
and
> move the buffer contents somewhere else.
>=20
>> Retrospectively
>> - i2c_smbus_ioctl_data.data shouldn=E2=80=99t have been a pointer =
type, but is.
>> - i2c_smbus_data.block should have been pointer, but isn=E2=80=99t
>>=20
>> And then the kernel would pass around an 32-bit-only i2c_smbus_data =
union -- by value.
>> Which would have been much leaner, and leave the right buffer choice
>> entirely to the client.
>>=20
>> One could explore this in kernel space. Let me know how you=E2=80=99d =
like to experiment.
>=20
> ? I'd like to keep kernel space and user space in sync. Why should we
> have a different i2c_smbus_data-variant in the kernel space? Or did I
> get you wrong.
>=20
>> But in userspace that means we=E2=80=99re looking at a new call =
number. >:)
>=20
> No way! :)

Here=E2=80=99s about what I meant.

Ok, it doesn=E2=80=99t really need a new call slot. Although, when
integrating into the original i2c_smbus_data and I2C_SMBUS, I=E2=80=99m =
not sure how
confusing this gets, to a casual reader not familiar with the history.

Daniel

diff --git a/include/uapi/linux/i2c-dev.h b/include/uapi/linux/i2c-dev.h
index 85f8047afcf2..38b1ae4d2448 100644
--- a/include/uapi/linux/i2c-dev.h
+++ b/include/uapi/linux/i2c-dev.h
@@ -58,7 +58,10 @@ struct i2c_smbus_ioctl_data {
        __u8 read_write;
        __u8 command;
        __u32 size;
-       union i2c_smbus_data __user *data;
+       union {
+               union i2c_smbus_data __user *data;
+               union i2c_smbus3_data __user u;
+       };
 };

 /* This is the structure as used in the I2C_RDWR ioctl call */
diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index f71a1751cacf..87ec2ea321ce 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -131,7 +131,9 @@ struct i2c_msg {
 /*
  * Data for SMBus Messages
  */
-#define I2C_SMBUS_BLOCK_MAX    32      /* As specified in SMBus =
standard */
+#define I2C_SMBUS_BLOCK_MAX    32      /* As specified in SMBus =
standard <=3D 3.0 */
+#define I2C_SMBUS3_BLOCK_MAX   255     /* As specified in SMBus 3.0 */
+
 union i2c_smbus_data {
        __u8 byte;
        __u16 word;
@@ -139,20 +141,36 @@ union i2c_smbus_data {
                               /* and one more for user-space =
compatibility */
 };

+typedef __u8 i2c_smbus_block[I2C_SMBUS_BLOCK_MAX + 2];
+typedef __u8 i2c_smbus3_block[I2C_SMBUS3_BLOCK_MAX + 2];
+
+union i2c_smbus3_data {
+       __u8 byte;
+       __u16 word;
+       i2c_smbus_block *block32;
+       i2c_smbus3_block *block255;
+};
+
 /* i2c_smbus_xfer read or write markers */
 #define I2C_SMBUS_READ 1
 #define I2C_SMBUS_WRITE        0

 /* SMBus transaction types (size parameter in the above functions)
    Note: these no longer correspond to the (arbitrary) PIIX4 internal =
codes! */
+
+#define I2C_SMBUS3_BLOCK 0x10
+
 #define I2C_SMBUS_QUICK                    0
 #define I2C_SMBUS_BYTE             1
 #define I2C_SMBUS_BYTE_DATA        2
 #define I2C_SMBUS_WORD_DATA        3
 #define I2C_SMBUS_PROC_CALL        4
 #define I2C_SMBUS_BLOCK_DATA       5
+#define I2C_SMBUS3_BLOCK_DATA      (5|I2C_SMBUS3_BLOCK)
 #define I2C_SMBUS_I2C_BLOCK_BROKEN  6
 #define I2C_SMBUS_BLOCK_PROC_CALL   7          /* SMBus 2.0 */
+#define I2C_SMBUS3_BLOCK_PROC_CALL  (7|I2C_SMBUS3_BLOCK)
 #define I2C_SMBUS_I2C_BLOCK_DATA    8
+#define I2C_SMBUS3_I2C_BLOCK_DATA   (8|I2C_SMBUS3_BLOCK)

 #endif /* _UAPI_LINUX_I2C_H */

=E2=80=94 snip =E2=80=94

So:

 - ioctl_data.data would be inline. No more extra pointer derefs
   just to pass a .byte or .word

 - Likewise, kernel code gets to pass a leaner

       i2c_smbus_xfer( .., union i2c_smbus3_data data) {} etc.

   Note the lack of =E2=80=98*=E2=80=99 in =E2=80=98data=E2=80=99.

 - All clients get to choose between i2c_smbus_block or =
i2c_smbus3_block,
   depending on slave specs.

 - Similarly, code concerned about (stack) memory gets to pick=20
   size =3D I2C_SMBUS_BLOCK_x vs I2C_SMBUS3_BLOCK_x.
   So we=E2=80=99d keep the old names in place, too.

 - But suffers terrible consequences when mixing I2C_SMBUS3_ transfers
   with i2c_smbus_data buffers.

   Really worth it? Sincerely, if 220-ish extra bytes aren=E2=80=99t
   a big deal, let=E2=80=99s step back and admit it adds not enough =
value.

 - Above won=E2=80=99t build yet, unless we=E2=80=99re okay with =
linux/i2c-dev.h=20
   including linux/i2c.h.

Hth,
Daniel


