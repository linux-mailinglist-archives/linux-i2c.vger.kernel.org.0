Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3751482DC
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 14:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfFQMpx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 08:45:53 -0400
Received: from mga17.intel.com ([192.55.52.151]:2718 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbfFQMpx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 08:45:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jun 2019 05:45:52 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga008.jf.intel.com with ESMTP; 17 Jun 2019 05:45:48 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 4/6] usb: dwc3: qcom: Add support for booting with ACPI
In-Reply-To: <20190617124329.GH16364@dell>
References: <20190612142654.9639-1-lee.jones@linaro.org> <20190612142654.9639-5-lee.jones@linaro.org> <20190617102146.GG16364@dell> <87y320gzp4.fsf@linux.intel.com> <20190617124329.GH16364@dell>
Date:   Mon, 17 Jun 2019 15:45:44 +0300
Message-ID: <87r27sgz2f.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Lee Jones <lee.jones@linaro.org> writes:
> On Mon, 17 Jun 2019, Felipe Balbi wrote:
>
>> Hi,
>>=20
>> Lee Jones <lee.jones@linaro.org> writes:
>> >> In Linux, the DWC3 core exists as its own independent platform device.
>> >> Thus when describing relationships in Device Tree, the current default
>> >> boot configuration table option, the DWC3 core often resides as a chi=
ld
>> >> of the platform specific node.  Both of which are given their own
>> >> address space descriptions and the drivers can be mostly agnostic to
>> >> each other.
>> >>=20
>> >> However, other Operating Systems have taken a more monolithic approac=
h,
>> >> which is evident in the configuration ACPI tables for the Qualcomm
>> >> Snapdragon SDM850, where all DWC3 (core and platform) components are
>> >> described under a single IO memory region.
>> >>=20
>> >> To ensure successful booting using the supplied ACPI tables, we need =
to
>> >> devise a way to chop up the address regions provided and subsequently
>> >> register the DWC3 core with the resultant information, which is
>> >> precisely what this patch aims to achieve.
>> >>=20
>> >> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>> >> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> >> ---
>> >>  drivers/usb/dwc3/Kconfig     |   2 +-
>> >>  drivers/usb/dwc3/dwc3-qcom.c | 206 ++++++++++++++++++++++++++++++---=
--
>> >>  2 files changed, 179 insertions(+), 29 deletions(-)
>> >
>> > I'm starting to get a little twitchy about these patches now.  Due to
>> > the release cadence of the larger Linux distros, it's pretty important
>> > that these changes land in v5.3.  Without them, it is impossible to
>> > install Linux on some pretty high profile emerging platforms.
>> >
>> > It's already -rc5 and I'm concerned that we're going to miss the
>> > merge-window.  Would you be kind enough to review these patches
>> > please?  The Pinctrl and I2C parts of the set have already been
>> > merged.
>>=20
>> I don't seem to have this series in my inbox. This is the only email I
>> have in this series.
>
> I did wonder, which is why I made sure I sent this to your Intel
> address as well.  Is your @kernel.org address broken?

not really, that drops in a valid inbox. I didn't receive it in either,
however. :-s

> Will re-send the patches to your Intel address, give me a few
> minutes.

Thanks.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0Hi3gACgkQzL64meEa
mQY6cw//UR0+y5aHXtLn2hjlVUhYgBlcnFJr3gT/bI+asF95lLJrC5erexaMReya
oVXaqMIj1FicOrT8LH6BQrAO7pCkK1nzMRa1Zzz0eaP02V+4KBw2rQdY3DqPN2UR
cFRTPiG3rLyKTtFvjGbbg7T4eA7x5sXsgW95up5xFl3xWNMNvwk0Lhem+sIZgFFW
SdEyfrkdqOEmKTXvLS+4FuEt3SHvPRjNfqHLR//JRSpRa9JFYak2GvFiSeJUfj1o
Slw074pz4bcsUa2XGXElFv2FqG0SbsTlYWS2D8u3s5XaKk2zAMo35Be9JT2uFvL5
kQyHVoNowkSXm27o19tBiqaidyRhEnQUxs8sBLNyVvr5dI7rKzTAbXY3F5zr4nVd
7BNohgUx1c+UDbagD3hYJ4uP40lGGTgLx8UjU0V/iigzOdIqNJLZm4vJ3CxkBDI4
OS9Xgvg6keTCk/PwEoM6QevioGBta7+nlLYHkFZD2NaCoRc1u5iQqfLe0TmCuFJh
pP+m7g0yCXX9BXikm1XnPBcaA4sZ1BsYx7JN9LczYM6paqPm4vWwnxVkAbIv0bwe
baDR7JtlY9ISajgV40UArHLkcN7+2/XHVNxgrTHfnluw/AFUfGkCl+soPC/CrTg4
gPuvGPbuYM2oRfaWRGJJNyW/7yz4FUutnBFGdmZqD3JubShRE34=
=FCzN
-----END PGP SIGNATURE-----
--=-=-=--
