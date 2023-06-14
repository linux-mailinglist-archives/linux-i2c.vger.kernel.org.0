Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503A97309D6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 23:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjFNVbN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 17:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFNVbM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 17:31:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D403B1FFA
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 14:31:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7083D61B03
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 21:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D651C433C8;
        Wed, 14 Jun 2023 21:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686778270;
        bh=2KhbGjsEA7pxONueJ38glWzPl9skNwfgnwlIpPBWsBw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oGKeJSErsTi3COH4BJlIvoDZFfBbtVZn/S7FBp+LqiwTT0mcmiivXKdvFc05Xc2zU
         b6uX4+uDyNh3LfnvaiytEpzrkf+vgKqdjsRS8H/YxzsMHMtrd5JRksZ3Nx7cI9Jj2s
         VZ1HsbZj/WkFWzxTib+zM0WlzWvVQlbFDOfSej+PXqPT4SIVDnPX7oWq1AV+NSzB4i
         nEgC0NQBhJubo8cZNF9efk2b0JaSbp3cvhapdt9ukMwqkvF//YSvrVBCjb1yuL9DsB
         g3WFOmkAgvIz62SVHKPHYlqxot7TakhVscuWFp36U1yHNhhlLQ32jseK46p4UmCIct
         XaUXDEgpwewmQ==
Date:   Wed, 14 Jun 2023 23:31:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Paul Wise <pabs3@bonedaddy.net>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools v2] i2cdetect: add messages for errors during
 bus listing
Message-ID: <ZIoxmbo9Cu+bPHsF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Paul Wise <pabs3@bonedaddy.net>, Jean Delvare <jdelvare@suse.de>,
        linux-i2c@vger.kernel.org
References: <20230526002445.57064-1-pabs3@bonedaddy.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="89b6X3pyz15KEJSr"
Content-Disposition: inline
In-Reply-To: <20230526002445.57064-1-pabs3@bonedaddy.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--89b6X3pyz15KEJSr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

thank you for this patch!

> This makes it easier for new users to understand what is going on when
> they have a problem listing i2c busses that they do not understand.

I like this basically. I do have questions, though.

> @@ -199,6 +218,13 @@ struct i2c_adap *gather_i2c_busses(void)
>  	/* look in sysfs */
>  	/* First figure out where sysfs was mounted */
>  	if ((f =3D fopen("/proc/mounts", "r")) =3D=3D NULL) {
> +		fprintf(stderr, "Error: Could not open /proc/mounts: "
> +                                "%s\n", strerror(errno));
> +		if (errno =3D=3D ENOENT) {
> +			fprintf(stderr, "Please mount procfs: "
> +			        "%smount -t procfs proc /proc\n",
> +			        getenv("SUDO_COMMAND") ? "sudo " : "");

Hmm, I wonder if a simple "Is it mounted?" isn't enough?

> +		fprintf(stderr, "Error: Could not find sysfs mount\n");
> +		fprintf(stderr, "Please mount sysfs: "
> +		        "%smount -t sysfs sysfs /sys\n",
> +                        getenv("SUDO_COMMAND") ? "sudo " : "");

Ditto.

>  		goto done;
>  	}
> =20
>  	/* Bus numbers in i2c-adapter don't necessarily match those in
>  	   i2c-dev and what we really care about are the i2c-dev numbers.
>  	   Unfortunately the names are harder to get in i2c-dev */
> +	sysfs_end =3D strlen(sysfs);
>  	strcat(sysfs, "/class/i2c-dev");
> -	if(!(dir =3D opendir(sysfs)))
> +	if (!(dir =3D opendir(sysfs))) {
> +		if (errno =3D=3D ENOENT) {
> +			/* Check if there are i2c bus devices in other dirs
> +                           as when there are none the error isn't useful
> +                           as loading i2c-dev also won't find devices */
> +			int devices_present =3D 0;
> +			strcpy(sysfs + sysfs_end, "/bus/i2c/devices");
> +			devices_present =3D dir_has_entries(sysfs);
> +			if (! devices_present) {
> +				strcpy(sysfs + sysfs_end, "/class/i2c-adapter");
> +				devices_present =3D dir_has_entries(sysfs);
> +			}
> +			if (devices_present) {
> +				fprintf(stderr, "Error: Could not find dir "
> +				        "`%s`\n", sysfs);
> +				fprintf(stderr, "Please load i2c-dev: "
> +				        "%smodprobe i2c-dev\n",
> +					getenv("SUDO_COMMAND") ? "sudo " : "");
> +			}

If there are no devices_present here, then we fail without printing
something? Is this intended?

> +		} else {
> +			fprintf(stderr, "Error: Could not open dir "
> +				"`%s': %s\n", sysfs, strerror(errno));

Despite the above detail, I think this adds quite some code (also
counting dir_has_entries). Since I think we need i2c-dev anyway, can't
we just do:

1) say "please load i2c-dev" if it is not loaded
2) say "could not open dir" if it is loaded

Yes, for rare cases this could mean that loading "i2c-dev" does not
solve the problem, but using i2ctools without i2c-dev is going to fail
at some point anyhow, so IMHO we can complain about this early?

Makes sense? Did I miss something?

Happy hacking,

   Wolfram


--89b6X3pyz15KEJSr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSKMZIACgkQFA3kzBSg
KbajEBAAp3cy0v0nOUg0CXwFpLGb8eL3d67RJYCXJrp4hDaFlBfCDUCO9IdHXNQk
MSHdmtoepoRsUEUHmFA/60c111y7A4FAz8Zrb6kuluarluR1/ijKJe/94x+2sRV7
WL83PngXHv5m6IhLRIdSA7l8JE5GOYq4ZAIxXdYCylKBQP0O4QZPkxBimKFHVag3
i1nq7bpFs7Qj4wImdQswF83m3OdZnDKFdJYn/VNb2sdWzXoZ1WEn4SvGDDRMZ7Aj
+09SFOjqT48uHaY6P7Dg3DRLgil/7njoDLfEFaXmIWeKi0hT8002cfS+NmUtX1xR
dN54tSBKkjbDy1OnvMPr6n7/M03E9fuKOyZRhXYMZNj/T5HUKEm94jB4+TgsFX2K
zCL7ZUu4ktX8SP8VZM6jG6ufJ1+gtfutOWJSIsrxW26ZfsGbc8FIpvWVI8AHAYzQ
BF0GVixRNIxRjeMhfhzhBP9KsG5RJKtqEQMdlC2tLBfRhaSGse5eSEsBZ7yxpvMw
zjK4si/v0B8Y7Tst3GwFlyQ3JsRZlLbTVP6iHCrVtyMR/oyBCXiycmPsYtqV2eGj
Ypc7zJxxWOxp8403Ulh4fJ2COKLaZBG4MugjG+ojCIXt9MKU6lNjO4H7fLS+L88R
EUuwV5mVg9FBQXayfXhUYORk8OB6thSOy8jpk8aXsE+HCTwfVHI=
=hZnz
-----END PGP SIGNATURE-----

--89b6X3pyz15KEJSr--
