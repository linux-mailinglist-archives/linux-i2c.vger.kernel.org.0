Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A88022FAB8
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgG0Uxm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:53:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726769AbgG0Uxm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jul 2020 16:53:42 -0400
Received: from localhost (p5486cd33.dip0.t-ipconnect.de [84.134.205.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6845520838;
        Mon, 27 Jul 2020 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595883221;
        bh=p25D3o3Lh0uks+G3LXpohvqlwH02ZCsiP5sdtJ3cx9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wpGqTsn3I3XXVhYUIZUI4DHHWHCva2s++zSVnic/askqJ/siYX97cZQgQweoQ2IlH
         meUkQQokNICU8Ob14h4ihCNUtxZT+wuBH6IHuQCOQiHJteBZHR4vTh9xYNz5ySuhP2
         VEdHRqUuw+xRV5Mhiiq01YnUQA9JDLl4W/KB52j8=
Date:   Mon, 27 Jul 2020 22:53:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Stodden <daniel.stodden@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: i2c block reads > 32 bytes
Message-ID: <20200727205338.GC18997@ninjato>
References: <9329EDA0-18B6-48EB-AD2B-AA27FAC6FF0A@gmail.com>
 <20200726103445.GA1714@kunai>
 <F76BBB88-55D9-466F-8E39-730D18766917@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline
In-Reply-To: <F76BBB88-55D9-466F-8E39-730D18766917@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

> Before reading on: sorry in advance for a very long reply.
> If you want to split the conversation into sub-items, let me know.

We will see if that makes sense. In general, I am happy that you also go
into details already!

> With =E2=80=99set in stone=E2=80=99 I was just echoing what I found old p=
osts, which
> seemed to acknowledge the difficulties:
>=20
> E.g. "this will never change=E2=80=9C in
> https://marc.info/?l=3Dgit-commits-head&m=3D113053689014136&w=3D2.

Same as Jean, I read this as "I2C_SMBUS_I2C_BLOCK_MAX will never be
different from I2C_SMBUS_BLOCK_MAX". This is why the former could go.
The latter is a different thing.

> The level of compatbility offered through
> i2c_smbus_xfer_emulated is probably essential anywhere (kernel + user
> clients). So leaving out I2C_SMBUS and relying only on I2C_RDWR seems
> incomplete.

Yes.

> Let me first summarize, there seem to be two areas of work then:
>=20
> - I2C_SMBUS should support block transfers up to 255 bytes.
>=20
>   One concern here is how to guarantee that growing i2c_smbus_data
>   does not break the binary interface, both in user and kernel space.

Exactly.

> - I2C_RDWR should support block transfers up to 255 bytes.=20
>=20
>   The ioctl interface looks robust enough (to me), since msg[i].len
>   may carry the difference without changing semantics.
>=20
>   But the master_xfer interface, while employting the same i2c_msg
>   type, is different from the ioctl one, and it currently doesn't
>   accommodate block length > 32 bytes.
>=20
>   (Maybe I should rename this item to "master_xfer should =E2=80=A6=E2=80=
=9D. Just
>   leaving it there in case I2C_RDWR needs work I didn=E2=80=99t see yet.)

I fully agree to Jean's comments here.

>  - I agree that I2C_SMBUS20_BLOCK_MAX and I2C_SMBUS30_BLOCK_MAX, and
>    conditional compilation, may pave the way.

No conditional compilation, please. One kernel should support both. But
two defines to not mix up things.

>=20
>  - Intuitively, it sees a dedicated I2C_SMBUS_LATEST_BLOCK_MAX is too muc=
h.
>=20
>    Simply because 255 designates the 1-byte length prefix limit. Smbus
>    would need word-sized prefixes to further expand, at which point
>    both the link layer protocol and the kernel ABI would have to
>    evolve significantly beyond what we're currently looking at.
>=20
>    This is as redundant as =E2=80=9CI2C_SMBUS_I2C_BLOCK_MAX=E2=80=9D used=
 to be.

I agree.

>  - Unless we see a value in conditional compilation in the headers,
>    should I2C_SMBUS_BLOCK_MAX just get removed?

Interesting idea. I am far more familiar with kernel space than user
space. In kernel space, I would rename I2C_SMBUS_BLOCK_MAX to
I2C_SMBUS2_BLOCK_MAX. And then probably remove the old
I2C_SMBUS_BLOCK_MAX altogether because we now utilize the whole 8 bit
size field. But we can't do this in userspace.

So, when next rc1 is out, I will send out conversion patches to all
users of I2C_SMBUS_BLOCK_MAX and convert them. Except for the I2C core
parts which expose to userspace. On this, we can work in parallel.

>  - I understand the kernel clients may be satisfied with the
>    above. User space is what's primarily on my mind.

Sounds like we make a good team then :)

>  * Would we compile i2c_smbus_data conditionally in the header?=20
>    I.e. let userspace
>    do things like -DI2C_SMBUS_BLOCK_MAX=3DI2C_SMBUS30_BLOCK_MAX?
>=20
>    (Not saying it's my preferred way, if avoidable. Just putting it here.)

Nope. Nothing conditional, please.

>  * Alternatively, I could see room for a union i2c_smbus30_data, to
>    leave the classic i2c_smbus_data alone.
>=20
>    This in turn would render i2c_smbus_ioctl_data.data as a union pointer=
-type.

Sounds like the safest path to me.


>  * Semantics for i2c_smbus_ioctl_data.size have always been strictly
>    defined: valid range is currently 0..8.
>=20
>    Would we consider allocating bit positions greater
>    size[0:3] do communicate a user block size of
>    I2C_SMBUS30_BLOCK_MAX, next to the given transaction type?
>=20
>    #define I2C_SMBUS_QUICK	    0
>    [..]
>    #define I2C_SMBUS_I2C_BLOCK_DATA    8
>    #define I2C_SMBUS30_BLOCKSIZE    (1<<31)
>=20
>    or similar?

Let's try the other solution first.

>  * Btw, I thought the transition to 255 bytes was Smbus 3.1, not Smbus
>    3.0 (?). Should these be named I2C_SMBUS31 instead?

Nope, it was SMBus 3.0 which introduced it:
http://smbus.org/specs/SMBus_3_0_20141220.pdf

Sidenote: Length can now be 0 as well which wasn't the case before (at
least for PROC_CALL).

> So here goes my current state of mind about I2C_RDWR.
>=20
>  - Foremost: agreed, userspace talking to Smbus (or PMBus, or any
>    other variant) should stay encouraged to employ SMBUS calls, not
>    I2C_RDWR based calls.
>=20
>  - Nonetheless, the I2C_RDWR ioctl and I2C_M_RECV_LEN exist, and
>    should naturally evolve to accommodate transfers length > 32, too.

Yes.

> Now, regarding i2c_transfer, aka master_xfer: presently, there is a trans=
form in
> i2cdev_ioctl_rdwr, resulting in
>=20
>  * i2c_msg as passed to i2cdev_ioctl_rdwr
> vs
>  * i2c_msg as passed to i2c_transfer
>=20
> having different semantics:
>=20
> https://github.com/torvalds/linux/blob/v5.8-rc7/drivers/i2c/i2c-dev.c#L28=
5:
>=20
> 		msgs[i].buf =3D memdup_user(data_ptrs[i], msgs[i].len);
>=20
>                 [..]
>=20
> 		if (msgs[i].flags & I2C_M_RECV_LEN) {
>                         [..]
>=20
> 			msgs[i].len =3D msgs[i].buf[0];
>                 }
>=20
> Iow, msg[i].len in master_xfer will only hold <extra_bytes>, not
> sizeof(buf). To a bus adapter, this means:
>=20
>  * The actual size of msg.buf is not known.=20

I never had a device with I2C_M_RECV_LEN, so I never noticed this code
in i2c-dev. Your arguments make sense to me, so I wonder why the above
mechanism was implemented like this. I believe there is a reason, but
for today I don't have the bandwidth to dive into it. That all
withstanding, I think it is fixable without hurting userspace.

>  * The way drivers handle i2c_msg output is:
>=20
>    1. read the length prefix into msgs[i].buf[0]
>    2. ensure msgs[i].buf[0] <=3D I2C_SMBUS_BLOCK_MAX
>    3. msg[i].len +=3D msg[i].buf[0]
>=20
> And the latter is what gets copied back to userspace. This seems to be
> a very common construct I see in most adapter implementations in i2c/buss=
es.

Yes.

>  * Replace above msgs[i].buf =3D memdup_user(.., msg[i].len) with
>    allocating a buffer sized *at least* 255 + extra_bytes, then
>    copying msg.len bytes from user.
>=20
>  * Hardware + drivers wishing to support transfers > 32 bytes can then
>    always rely on I2C_SMBUS30_BLOCK_MAX (255) bytes to be available.
>=20
>    The above msg[i].len handling algo remains in place.
>    The only thing changing is the buffer size guarantee alone.
>=20
>  * On the return path from i2c_transfer(), a user-msg[i].len too small
>    to contain the result might EFAULT.
>=20
>    Unless a different errno seems seems better suited, to avoid
>    ambiguities. EMSGSIZE?
>=20
>    In any case, the philosophy would be that user msg lengths
>    would be handled in i2c-core, not at all by drivers, beyond an option
>    to adopt larger buffers.
>=20

Probably a good idea, but I need to dive into some more to give a fully
qualified comment hre.

>  * For safety, either leave I2C_SMBUS_BLOCK_MAX at 32 by default,
>    when building busses/*. Or
>    initially substitute all uses with I2C_SMBUS20_BLOCK_MAX.
>=20
>    I suppose it=E2=80=99s the latter, unless we avoid I2C_SMBUS20_BLOCK_M=
AX
>    altogether, and stay with I2C_SMBUS_BLOCK_MAX=3D32 everywhere.
> =20
> The last point is because 32B-only capable drivers should avoid
> breaking hardware semantics in some pathologic cases. Until they
> get reviewed, each individually.

Yes, the only mass-conversion I'd suggest is from I2C_SMBUS_BLOCK_MAX to
I2C_SMBUS20_BLOCK_MAX which is a plain rename. If a bus master driver
wants to support 255 byte transfers, then it needs an individually
crafted and tested patch. It will be trivial for most drivers, still.

> If the above sounds good enough to get started, I could volunteer to
> make a prototype change. But I'd rather hear other opinions first.

I can prepare an initial branch for us to work on.

> Yes, I=E2=80=99d anticipate this should see a bunch of reviews from all k=
inds of people.
> Kernel, user, etc.

I am glad that Jean (former I2C maintainer and with lots of distro
experience) already commented.

> As a first goal, we should find a point where anyone feels the most impor=
tant
> requirements are at least gathered.

I think kernel side is pretty good, and we have an idea which path to
tackle for userspace, too. Or?

> Is i2c-tools maintaned by roughly the same folks reading linux-i2c?
> Who else cares most, besides kernel clients?

Yes, Jean is the maintainer and I have write access there, too. We are a
good bunch already, and maybe others will join as well.

Thanks and happy hacking,

   Wolfram


--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8fPtIACgkQFA3kzBSg
Kbbang//TZiFwkaMtxVnlAzrhyZ82+Zf9o2GbvwvE/6mDZLvQmpSnHkKJa6j8AcN
PXpK9musYO4Q+D3AH3u4aVwTD+0Oiv9ZNQ/nbVIAx5qyOCtwbknPr+vJEi9leC7d
BJl4m9uQzXBKIwRuMFuHNvX+J9Js9d+ys0R8FMW+LDfRWqUX4tJqrR/KrKKofpvF
4uBfvZOoiWqjXxA3UjHsNB8lWDcLGAdpwJGWYNHi8DAkzQA1sk8nOvJKRmQGtHiA
EGSWCLm3PwD8uVb58GgANAXuOp5FlT3ZJbAh+bLK0Jthz2sSexxvo0a6mR7YgxG7
Duc311BzPwZ3LgqSAFD6pm010hfaZ2Td8Zfq+k2aXs6iKIi4fsUUjXTYWb2vnKJI
5PBqz4qaLt+AoiOrh+bzvUiSJ+Id9ZGM8ZA9wHSy1HhwWmTaAzHkcATfLr2RfHhU
MxGAJW51Jb8aXFjXl9nTs7TAgJkYEcMOBcFowegHH61OvJlXsOa3E+McE3Qe9nBi
5RdNJy7cnimQHdqWDJZrzX/A36QNGYLn3KRyc3yfDGefABKC9/zKcWmq9KxVMMDr
/NimaSlsZ7fakMex8v5YHjY55OJpdfXoz4lSw1ffZKRIMoP0UO69fy+LXVgiBbh3
iVSzHaUlHTRJFH+ry9PIpwpaBczLWbjrIN/xYim/QaQnRhrhj+U=
=Q41u
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
