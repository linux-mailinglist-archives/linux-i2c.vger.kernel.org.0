Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A0B78FC31
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 13:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbjIALRN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 07:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbjIALRM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 07:17:12 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40C2107;
        Fri,  1 Sep 2023 04:16:46 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 787811F74C;
        Fri,  1 Sep 2023 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693567005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FEPvF2p5HdgW8HWvDpYUyBJp3VDJGFIFNd6UAuLDyRc=;
        b=fKbPSWollXJHMMkKmdb3oP9WAZFgiyUV28SYrgwX15z5Jy8cPF4FkhrZTC/UvZ27NakH1y
        RXD+za/A5RECSUoTu2bNYJKEptuhLkfp444nCHHKA/pPh2XG9+7s5A1I6+V2f3qdgnFtuk
        v7o6T0Fz1LnUVmPgeXWSmNs0Ai+B0fQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693567005;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FEPvF2p5HdgW8HWvDpYUyBJp3VDJGFIFNd6UAuLDyRc=;
        b=h065EFhHXEh2TZNp5rMpcKPOxY9ww8XMAc6PFATi/YkblUZgyKAclOIdf0Ay1lfAVMz3iL
        U9QcSyTqpRWslLBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44AA813582;
        Fri,  1 Sep 2023 11:16:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GTguDx3I8WTQegAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 01 Sep 2023 11:16:45 +0000
Date:   Fri, 1 Sep 2023 13:16:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/14] I2C: sis5595: Do PCI error checks on own line
Message-ID: <20230901131644.7337daf8@endymion.delvare>
In-Reply-To: <20230824132832.78705-10-ilpo.jarvinen@linux.intel.com>
References: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com>
        <20230824132832.78705-10-ilpo.jarvinen@linux.intel.com>
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

On Thu, 24 Aug 2023 16:28:27 +0300, Ilpo J=C3=A4rvinen wrote:
> Instead of if conditions with line splits, use the usual error handling
> pattern with a separate variable to improve readability.
>=20
> No functional changes intended.
>=20
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-sis5595.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-si=
s5595.c
> index c793a5c14cda..486f1e9dfb74 100644
> --- a/drivers/i2c/busses/i2c-sis5595.c
> +++ b/drivers/i2c/busses/i2c-sis5595.c
> @@ -175,11 +175,11 @@ static int sis5595_setup(struct pci_dev *SIS5595_de=
v)
> =20
>  	if (force_addr) {
>  		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_ba=
se);
> -		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
> -		    !=3D PCIBIOS_SUCCESSFUL)
> +		retval =3D pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base);
> +		if (retval !=3D PCIBIOS_SUCCESSFUL)
>  			goto error;
> -		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
> -		    !=3D PCIBIOS_SUCCESSFUL)
> +		retval =3D pci_read_config_word(SIS5595_dev, ACPI_BASE, &a);
> +		if (retval !=3D PCIBIOS_SUCCESSFUL)
>  			goto error;
>  		if ((a & ~(SIS5595_EXTENT - 1)) !=3D sis5595_base) {
>  			/* doesn't work for some chips! */
> @@ -188,16 +188,16 @@ static int sis5595_setup(struct pci_dev *SIS5595_de=
v)
>  		}
>  	}
> =20
> -	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
> -	    !=3D PCIBIOS_SUCCESSFUL)
> +	retval =3D pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val);
> +	if (retval !=3D PCIBIOS_SUCCESSFUL)
>  		goto error;
>  	if ((val & 0x80) =3D=3D 0) {
>  		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
> -		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
> -		    !=3D PCIBIOS_SUCCESSFUL)
> +		retval =3D pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val =
| 0x80);
> +		if (retval !=3D PCIBIOS_SUCCESSFUL)
>  			goto error;
> -		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
> -		    !=3D PCIBIOS_SUCCESSFUL)
> +		retval =3D pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val);
> +		if (retval !=3D PCIBIOS_SUCCESSFUL)
>  			goto error;
>  		if ((val & 0x80) =3D=3D 0) {
>  			/* doesn't work for some chips? */

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
--=20
Jean Delvare
SUSE L3 Support
