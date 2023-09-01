Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7EF78FC1A
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 13:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243662AbjIALMX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 07:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjIALMX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 07:12:23 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9E4D7;
        Fri,  1 Sep 2023 04:12:20 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 084711F45E;
        Fri,  1 Sep 2023 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693566739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=21vuDQkYN5HC3HH5PCAvjZ9MT2ScmKbgMXvif2eGyRI=;
        b=vrsb3HdkX5gouZ4P8zcvHlV2cZIsv+dNzECBrGkdcW6W7GnQZakRswSiYqVrZlfsNexdWd
        ZSzlne9iEb4Je8UVnNIyaBqcYMeTwPgMfVKSeu0c+barp9InOsuLWm3tDkpfWh2SrVjYo2
        tyMMZe8MbzrieNUT/1vlQNCIGnZEtBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693566739;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=21vuDQkYN5HC3HH5PCAvjZ9MT2ScmKbgMXvif2eGyRI=;
        b=xeTwpyDPcCIgV5RoyypBcBKNb8iBT70Q1LBkKl/GhrIHvwTbegeyTWqOXVVkDfp15yXE52
        t5/K11hX0hLzL/BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB6BD13582;
        Fri,  1 Sep 2023 11:12:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Px4uLBLH8WR3eAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 01 Sep 2023 11:12:18 +0000
Date:   Fri, 1 Sep 2023 13:12:17 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/14] I2C: nforce2: Do PCI error check on own line
Message-ID: <20230901131217.139c0cce@endymion.delvare>
In-Reply-To: <20230824132832.78705-9-ilpo.jarvinen@linux.intel.com>
References: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com>
        <20230824132832.78705-9-ilpo.jarvinen@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 24 Aug 2023 16:28:26 +0300, Ilpo J=C3=A4rvinen wrote:
> Instead of a if condition with a line split, use the usual error
> handling pattern with a separate variable to improve readability.
>=20
> No functional changes intended.
>=20
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-nforce2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nf=
orce2.c
> index 777278386f58..38d203d93eee 100644
> --- a/drivers/i2c/busses/i2c-nforce2.c
> +++ b/drivers/i2c/busses/i2c-nforce2.c
> @@ -327,8 +327,8 @@ static int nforce2_probe_smb(struct pci_dev *dev, int=
 bar, int alt_reg,
>  		/* Older incarnations of the device used non-standard BARs */
>  		u16 iobase;
> =20
> -		if (pci_read_config_word(dev, alt_reg, &iobase)
> -		    !=3D PCIBIOS_SUCCESSFUL) {
> +		error =3D pci_read_config_word(dev, alt_reg, &iobase);
> +		if (error !=3D PCIBIOS_SUCCESSFUL) {
>  			dev_err(&dev->dev, "Error reading PCI config for %s\n",
>  				name);
>  			return -EIO;

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
--=20
Jean Delvare
SUSE L3 Support
