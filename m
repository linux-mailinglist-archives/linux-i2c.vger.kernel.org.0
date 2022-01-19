Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4974938EE
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 11:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353911AbiASKv6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 05:51:58 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:40304 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346702AbiASKv5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 05:51:57 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id ACA1A1F384;
        Wed, 19 Jan 2022 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642589516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kpTi7Guq+O1/U4zg2a4aglEet/VVuL7ggzH963MgAXk=;
        b=kMtf+vbt+KEHC8JNH4nZRhVcBpMyD6L9uYcjfvUa3r4HWTscHA149Jjt3b7nOdMZac5g9y
        374BhbkufFhaQs+Plnu7PaCWMBJaDvRUx3/QyOHl6vkNqfa1VJWqQHzAD4/hb7YaXFSG/g
        oJGd2MIIv1lc9Vt87BDBwu9W6siSHag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642589516;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kpTi7Guq+O1/U4zg2a4aglEet/VVuL7ggzH963MgAXk=;
        b=XUK/x3TEpdvhM8oyoqxBmHrj0sm4BsDTpe8egbcj+yJXFSCCvZOw3DJv2y6AeT60HMUtgo
        pElqKDcoeOWrPUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 605FB13B3D;
        Wed, 19 Jan 2022 10:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id yyNKFEzt52GcVQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 19 Jan 2022 10:51:56 +0000
Date:   Wed, 19 Jan 2022 11:51:54 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Jon P <theroguezeta@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>,
        Terry Bowman <Terry.Bowman@amd.com>
Subject: Re: i2c-tools does not work with AMD Cezanne APU's
Message-ID: <20220119115154.1ee789e9@endymion>
In-Reply-To: <CAPoa-_rS8foktCEU+aGFcWiVgmB7Tv92z5r0gX0Dk1DS0LcsiA@mail.gmail.com>
References: <CAPoa-_rth53JPWJB-c9hB+PCjyU=MvAHa2Db0h=ghciMgphvgQ@mail.gmail.com>
        <CAPoa-_rS8foktCEU+aGFcWiVgmB7Tv92z5r0gX0Dk1DS0LcsiA@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jon,

On Tue, 18 Jan 2022 17:26:03 -0800, Jon P wrote:
> After updating to a 5700G APU from a 2400G on my B450 board I am not
> able to access i2c interfaces which is a blocking issue to use OpenRGB
> on the DRAM and motherboard RGB controller (I am one of the developers
> of OpenRGB).
>=20
> I have opened an issue with the distribution that I am using and
> multiple other users are seeing the same issue but I have not seen any
> updates on the issue or request for more details so I am afraid that
> it has just gone into the void. Full details here:
> https://bugs.launchpad.net/bugs/1950062
>=20
> I see the same issues when using the i2c-tools as well when I am
> trying to read the DRAM so following the man page I would like to
> report a bug using the i2c-tools with AMD Cezanne APU's.

=46rom your logs, the i2c bus itself is not working. So this is
definitely not an i2c-tools issue, but a kernel driver issue.

Most likely this is related to the required change of register access
method for recent AMD chipsets which has been discussed recently:

https://lore.kernel.org/linux-i2c/20220118221152.300444-1-terry.bowman@amd.=
com/T/#t

--=20
Jean Delvare
SUSE L3 Support
