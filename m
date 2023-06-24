Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67CEF73CAA1
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 13:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjFXLcl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 07:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjFXLcT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 07:32:19 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8AEE1BD6
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 04:32:17 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 374101F750;
        Sat, 24 Jun 2023 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687606336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/83LIQLnQcpeq8ZrvcVG/kYVDvG7SWD5y/IzLh7Nf6w=;
        b=bOvrhzutB66SUCgjyWhZ1d7ohndkSWWMlS+aXtoFOKyghZIVOMakx3LwT9W0tzIqvARzYY
        33p/W63+N4oPerj2yYvb552waRzbP6X3wEiBJnYqsCtKJDdPWIJDW+d7I/LC0dZtHVjGKI
        CIGvkwtyTdCkwvDUtJ3h5GLKFpM6zkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687606336;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/83LIQLnQcpeq8ZrvcVG/kYVDvG7SWD5y/IzLh7Nf6w=;
        b=G84ZOGSmnz1VzY8wS0J/ysnOD8mt9tTRBke5NBAN+HWmuNZcd0MOKpsQB0DlANz8ceK11g
        4zzlZnXizw4dxLDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15D6D13483;
        Sat, 24 Jun 2023 11:32:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id PtyGA0DUlmS4HgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sat, 24 Jun 2023 11:32:16 +0000
Date:   Sat, 24 Jun 2023 13:32:14 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Read CPDL firmware version on Edgecore AS5114-48X
Message-ID: <20230624133214.48015fb6@endymion.delvare>
In-Reply-To: <688ccf73-1205-6ee6-d8e5-5b18c8abd9c7@molgen.mpg.de>
References: <688ccf73-1205-6ee6-d8e5-5b18c8abd9c7@molgen.mpg.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Paul,

On Wed, 21 Jun 2023 09:59:44 +0200, Paul Menzel wrote:
> I am trying to read the CPDL firmware version of the switch Edgecore=20
> AS5114-48X with dentOS (Debian based).
>=20
> In U-Boot it supposedly work like below:
>=20
>      Marvell>> i2c dev 2
>      Marvell>> i2c md 0x40 01 1 =20
>      0001: 01
>      Marvell>> i2c md 0x40 ff 1 =20
>      00ff: 03
>=20
> But I like to do it with GNU/Linux, but my attempts failed:
>=20
> ```
> # i2cdetect -y 2
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: UU UU -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- 6a -- -- -- -- --
> 70: -- UU UU UU UU UU UU --
> ```
>=20
> Nothing seems to be at address 0x40:
>=20
> ```
> # i2cdump -f -y 2 0x40
> No size specified (using byte-data access)
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> (...)
> f0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> ```
>=20
> Could the bus be different?

Yes, unlike the PCI bus which has a well defined topology, multiple I2C
root segments can coexist in a system and their numbering is largely
arbitrary. So there's no guarantee that i2c bus 2 on U-Boot is the same
as i2c bus 2 on Linux.

I'm not familiar with U-Boot but you may try "i2c dev" or "i2c bus"
commands there, maybe it will tell you what corresponds to i2c bus 2.

> (...)
> # find / -iname *cpld*
> /sys/bus/i2c/drivers/as4224_cpld
> (...)
> # ls -l /sys/bus/i2c/drivers/as4224_cpld/
> total 0
> lrwxrwxrwx 1 root root    0 Jun 20 16:53 0-0040 ->=20
> ../../../../devices/platform/ap806/ap806:config-space@f0000000/f0511000.i=
2c/i2c-0/0-0040
> --w------- 1 root root 4096 Jun 20 16:53 bind
> lrwxrwxrwx 1 root root    0 Jun 20 16:53 module ->=20
> ../../../../module/arm64_accton_as4224_cpld
> --w------- 1 root root 4096 May 16 10:21 uevent
> --w------- 1 root root 4096 Jun 20 16:53 unbind
> ```
>=20
> Is it bus 0?

Seems so, yes.

>=20
> ```
> # i2cdump -f -y 0 0x40
> No size specified (using byte-data access)
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 80 01 ff 07 0f cc cc cc cc cc cc cc cc cc cc cc    ??.?????????????
> 10: ff 03 3f cc 01 cc cc cc cc cc cc cc cc cc cc cc    .???????????????
> 20: ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .???????????????
> 30: ff ff ff ff cc cc cc cc cc cc cc cc cc cc cc cc    ....????????????
> 40: cc cc cc 0e cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
> 50: 0d 4a 03 00 7f cc cc cc cc cc cc cc cc cc cc cc    ?J?.????????????
> 60: 01 71 1e cc cc cc cc cc cc cc cc cc cc cc cc cc    ?q??????????????
> 70: 7f 7f 7f 7f 7f cc cc cc cc cc cc cc cc cc cc cc    ????????????????
> 80: 6c 69 69 69 68 cc cc cc cc cc cc cc cc cc cc cc    liiih???????????
> 90: 02 00 71 71 cc cc cc cc cc cc cc cc cc cc cc cc    ?.qq????????????
> a0: ff ff ff ff ff ff ff ff ff ff ff 7f cc cc cc cc    ...........?????
> b0: ff ff ff ff ff ff 00 00 00 00 00 00 cc cc cc cc    ............????
> c0: 0f fe ff ff ff 3f 00 00 00 00 00 00 cc cc cc cc    ??...?......????
> d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
> e0: 00 71 cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .q??????????????
> f0: 41 53 35 31 31 34 00 00 00 00 00 00 41 57 53 05    AS5114......AWS?
> ```
>=20
> What would be the values of `0x40 01 1` and ` 0x40 ff 1`?

As I understand the U-Boot i2c command syntax, 0x40 is the slave
address, 01/ff is the register offset (in hexadecimal, despite no
leading "0x") and 1 is the register count. So the equivalent Linux
i2c-tools commands, assuming i2c bus 0, would be:

# i2cget 0 0x40 0x01 b
# i2cget 0 0x40 0xff b

=46rom the full register dump above, these commands will most probably
return values (0x)01 and (0x)05, respectively. The former matches what
you got from U-Boot, the latter doesn't. Which may or may not indicate
a problem, depending on whether these values are supposed to be static
or if they could change over time.

Hope that helps,
--=20
Jean Delvare
SUSE L3 Support
