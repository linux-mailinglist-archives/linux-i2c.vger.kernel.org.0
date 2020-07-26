Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD62422E342
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 01:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgGZXVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 19:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgGZXVc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jul 2020 19:21:32 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82820C0619D2
        for <linux-i2c@vger.kernel.org>; Sun, 26 Jul 2020 16:21:31 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o13so8377241pgf.0
        for <linux-i2c@vger.kernel.org>; Sun, 26 Jul 2020 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PjdG5CDj7wwZMB36co7PuULVRJWZ6r5OPTHVRE8PDg4=;
        b=kOXAQz8vU3Nv/bS+vb6MFoGoFfevKA906N/aJd2Y1fbes+PNGJ0yfjZ3wzOso7ug6C
         XJ8CjUk5tJzVhAB/ggfeD+xOfCklpvSJeOjZMBaYtj61UuIbNsCH31TMN5x38ktCOAeJ
         OY0i5ATpJVgjlzFcyWhLmChAVt95EcZ+9O+ceADq5b12fa2h4UVHZOiwYKvg4ZdiMH6K
         S06JSvpe4RnvxILSQTOW0TyEqmyig9y/Dl6etxlBy/tBuYaWXNRSfhdEXFD5ZDRGbS4H
         F4gc+Z5VJ5kLpKjMg7oYg1Qa+RRfQ1uki84ZmNcPiRLlIO85DyzeqDQrDLrIZ2qF/Ra5
         pzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PjdG5CDj7wwZMB36co7PuULVRJWZ6r5OPTHVRE8PDg4=;
        b=Y1OTmjH+MqcZeuhWRqhRbI2LdsJhHtoStHLShEU+3h+t+BdDZAuGj3NDCZSBzzUHmQ
         ab+HNR0L0jZJkyIfLWAA6zrYlLGSdL5XDeMVWKpC1xO62z/ym6iyN5y54hjwuSKL8bXi
         pi69BRiB5g2HMhIcstkmkmruf5c2KE2Hl9LHj++Z4w5U0B02ryyGFFEEyhrYXFXHR0yu
         Hd5cEQugKb8NebaB4MKbcZKCWDGGSn5XEJo3dMzUprbdDuPZGACWX1E3sbMvJ47vm5th
         WE8/KDq4EQobcYl6bNtwAgQnpxqcL8GblsxU/Cetv4bk8LCym5srlfmD4E5Q6OGE/ZN6
         PSVQ==
X-Gm-Message-State: AOAM532vF3YV3+EBK+PObF1XEhagSsTdHVrgOypig34Qmu/w2V7BVo0j
        5CoFUBDpt8Rc38QtJyryRy2ESFNGseM=
X-Google-Smtp-Source: ABdhPJyNNCpTykiXeZsaoz2GBTqY6dwq4SnZ7BH7B4I/prYGgK34UThA6QIk9QCISW5I5dh+AmvY+g==
X-Received: by 2002:a63:417:: with SMTP id 23mr16512966pge.44.1595805690842;
        Sun, 26 Jul 2020 16:21:30 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id f131sm12785014pgc.14.2020.07.26.16.21.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 16:21:30 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: i2c block reads > 32 bytes
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <20200726103445.GA1714@kunai>
Date:   Sun, 26 Jul 2020 16:21:28 -0700
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F76BBB88-55D9-466F-8E39-730D18766917@gmail.com>
References: <9329EDA0-18B6-48EB-AD2B-AA27FAC6FF0A@gmail.com>
 <20200726103445.GA1714@kunai>
To:     Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi Wolfram,

Thanks for sharing your thoughts, much appreciated.

Before reading on: sorry in advance for a very long reply.
If you want to split the conversation into sub-items, let me know.

> On Jul 26, 2020, at 3:34 AM, Wolfram Sang <wsa@kernel.org> wrote:
>=20
> Hi Daniel,
>=20
>> Publicly available PMBus revisions appear to be based on SMBus 2.0,
>> but with relaxed constraints regarding block read/write length: 255
>> bytes, not 32. [1]
>=20
> I missed that detail for PMBus...

I can relate. I=E2=80=99ve known the physical and link layer protocols =
for a while,=20
but I=E2=80=99m only gradually learning about the  standards hierarchy =
and implied
limits these days, and then how they currently manifest in linux-i2c, =
specifically.

> I neither had hardware nor time for actually hacking on an
> implementation. However, I thought about how one could do it and I =
don't
> think the old limit is "set in stone". My idea for kernel space:
>=20
> #define I2C_SMBUS20_BLOCK_MAX 32
> /* Next one only for a transition period */
> #define I2C_SMBUS_BLOCK_MAX I2C_SMBUS20_BLOCK_MAX
>=20
> #define I2C_SMBUS30_BLOCK_MAX 255
> #define I2C_SMBUS_LATEST_BLOCK_MAX I2C_SMBUS30_BLOCK_MAX
>=20
> And with that:
>=20
> 1) Convert I2C_SMBUS_BLOCK_MAX to I2C_SMBUS20_BLOCK_MAX for all =
current
>   users in-tree to avoid regressions
>=20
> 2) Update the I2C core to handle I2C_SMBUS_LATEST_BLOCK_MAX
>=20
> 3) People can convert client drivers to I2C_SMBUS30_BLOCK_MAX
>   individually. So we ensure it has been properly tested.
>=20
> I haven't fully dived into it but I'd think something similar can be
> done for userspace, too.

This gets interesting.

I haven=E2=80=99t spent time on strategies upgrading i2c_smbus_data =
before
now. Rather I2C_RDWR, but I=E2=80=99m starting to reconsider, based on =
what
you write.

With =E2=80=99set in stone=E2=80=99 I was just echoing what I found old =
posts, which
seemed to acknowledge the difficulties:

E.g. "this will never change=E2=80=9C in
https://marc.info/?l=3Dgit-commits-head&m=3D113053689014136&w=3D2.

These comments are 15 years old now, but to me it seemed to anticipate =
that any
later evolution would naturally pick I2C_RDWR over I2C_SMBUS. That=E2=80=99=
s about
where my =E2=80=99set in stone' came from. Anway, let=E2=80=99s scratch =
that.

The level of compatbility offered through
i2c_smbus_xfer_emulated is probably essential anywhere (kernel + user
clients). So leaving out I2C_SMBUS and relying only on I2C_RDWR seems
incomplete.

(Similarly, assuming that any adapter capable of transfers > 32 bytes
will implement master_xfer (mine does that) rather than smbus_xfer was
probably naive of me.)

Let me first summarize, there seem to be two areas of work then:

- I2C_SMBUS should support block transfers up to 255 bytes.

  One concern here is how to guarantee that growing i2c_smbus_data
  does not break the binary interface, both in user and kernel space.

- I2C_RDWR should support block transfers up to 255 bytes.=20

  The ioctl interface looks robust enough (to me), since msg[i].len
  may carry the difference without changing semantics.

  But the master_xfer interface, while employting the same i2c_msg
  type, is different from the ioctl one, and it currently doesn't
  accommodate block length > 32 bytes.

  (Maybe I should rename this item to "master_xfer should =E2=80=A6=E2=80=9D=
. Just
  leaving it there in case I2C_RDWR needs work I didn=E2=80=99t see =
yet.)

I'll return to I2C_RDWR below. Regarding I2C_SMBUS:

 - I agree that I2C_SMBUS20_BLOCK_MAX and I2C_SMBUS30_BLOCK_MAX, and
   conditional compilation, may pave the way.

 - Intuitively, it sees a dedicated I2C_SMBUS_LATEST_BLOCK_MAX is too =
much.

   Simply because 255 designates the 1-byte length prefix limit. Smbus
   would need word-sized prefixes to further expand, at which point
   both the link layer protocol and the kernel ABI would have to
   evolve significantly beyond what we're currently looking at.

   This is as redundant as =E2=80=9CI2C_SMBUS_I2C_BLOCK_MAX=E2=80=9D =
used to be.

 - Unless we see a value in conditional compilation in the headers,
   should I2C_SMBUS_BLOCK_MAX just get removed?

   (I could also see I2C_SMBUS_BLOCK_MAX remain 32 bytes in future,
    instead of adding the specific SMBUS20_ variant.
    It might be advantageous, but I haven=E2=80=99t investigated =
further).

 - I understand the kernel clients may be satisfied with the
   above. User space is what's primarily on my mind.

Regarding userspace:

The part left open so far is that substituting I2C_SMBUS30_BLOCK_MAX
for I2C_SMBUS_BLOCK_MAX alone, whether conditional or fixed, renders
i2c_smbus_ioctl_data.data ambiguous. There is no way to see yet if
i2c_smbus_data.block is of size 34 bytes or 257.

Just trading ideas:

 * Would we compile i2c_smbus_data conditionally in the header?=20
   I.e. let userspace
   do things like -DI2C_SMBUS_BLOCK_MAX=3DI2C_SMBUS30_BLOCK_MAX?

   (Not saying it's my preferred way, if avoidable. Just putting it =
here.)

 * Alternatively, I could see room for a union i2c_smbus30_data, to
   leave the classic i2c_smbus_data alone.

   This in turn would render i2c_smbus_ioctl_data.data as a union =
pointer-type.

 * Semantics for i2c_smbus_ioctl_data.size have always been strictly
   defined: valid range is currently 0..8.

   Would we consider allocating bit positions greater
   size[0:3] do communicate a user block size of
   I2C_SMBUS30_BLOCK_MAX, next to the given transaction type?

   #define I2C_SMBUS_QUICK	    0
   [..]
   #define I2C_SMBUS_I2C_BLOCK_DATA    8
   #define I2C_SMBUS30_BLOCKSIZE    (1<<31)

   or similar?

 * Btw, I thought the transition to 255 bytes was Smbus 3.1, not Smbus
   3.0 (?). Should these be named I2C_SMBUS31 instead?

>> Recap: the problem with the current i2c-core is that =
i2cdev_ioctl_rdwr
>> is passing msg[i].len in a way which makes it impossible for adapters
>> to execute block reads greater 32: kernel msg[i].len isn=E2=80=99t =
user
>> msg[i].len, but set to the number of extra bytes initially, so the
>> adapter driver is left with assurance that 32 bytes buffer space
>> available, not how much, if more. I suppose this is intentional.
>=20
> I'd think we can extend that guarantee to 255 bytes when changing to =
the
> new max. Needs definately some more discussion with Jean, though. But
> also, if everything is correctly updated, you should be able to use =
the
> native i2c_smbus_* functions again. No need for rdwr detour.

So here goes my current state of mind about I2C_RDWR.

 - Foremost: agreed, userspace talking to Smbus (or PMBus, or any
   other variant) should stay encouraged to employ SMBUS calls, not
   I2C_RDWR based calls.

 - Nonetheless, the I2C_RDWR ioctl and I2C_M_RECV_LEN exist, and
   should naturally evolve to accommodate transfers length > 32, too.

 - I currently don't see a problem with the ioctl interface.

 - But I seem to sense an issue with the master_xfer as presently
   implemented by adapters.

I proably should have been more careful to not use master_xfer and
I2C_RDWR synonymously in my original post.

Regarding I2C_RDWR: Afaict, user code typically sets:

  * extra_bytes =3D 1 (length only) or 2 (length + pec) or greater.
  * datasize =3D /* as needed according to slave / command specification =
*/
  * msg[i].len =3D datasize + extra_bytes
  * msg[i].flags =3D I2C_M_RD | I2C_M_RECV_LEN
  * msg[i].buf =3D malloc(msg[i].len) or similar.
  . msg[i].buf[0] =3D extra_bytes

I assume there is no problem here: msg.len is u16 and so a datasize up
to 255 falls right into place. Just writing it down to point that out,
and for later reference (see below).

Now, regarding i2c_transfer, aka master_xfer: presently, there is a =
transform in
i2cdev_ioctl_rdwr, resulting in

 * i2c_msg as passed to i2cdev_ioctl_rdwr
vs
 * i2c_msg as passed to i2c_transfer

having different semantics:

=
https://github.com/torvalds/linux/blob/v5.8-rc7/drivers/i2c/i2c-dev.c#L285=
:

		msgs[i].buf =3D memdup_user(data_ptrs[i], msgs[i].len);

                [..]

		if (msgs[i].flags & I2C_M_RECV_LEN) {
                        [..]

			msgs[i].len =3D msgs[i].buf[0];
                }

Iow, msg[i].len in master_xfer will only hold <extra_bytes>, not
sizeof(buf). To a bus adapter, this means:

 * The actual size of msg.buf is not known.=20

   msg.len =3D=3D msg.buf[0] (=3D=3D extra_bytes)

   In binary, the size of msg.buf is only guaranteed to be greater
   than I2C_SMBUS_BLOCK_MAX + extra_bytes. It might be greater, but
   that information isn't passed on.

 * The way drivers handle i2c_msg output is:

   1. read the length prefix into msgs[i].buf[0]
   2. ensure msgs[i].buf[0] <=3D I2C_SMBUS_BLOCK_MAX
   3. msg[i].len +=3D msg[i].buf[0]

And the latter is what gets copied back to userspace. This seems to be
a very common construct I see in most adapter implementations in =
i2c/busses.

There are a number of ways to expand this beyond
I2C_SMBUS_BLOCK_MAX=3D32, but some care seems to be needed.

Here is a relatively simple approach I'd suggest (not like I insist
it's the right one):

 * Replace above msgs[i].buf =3D memdup_user(.., msg[i].len) with
   allocating a buffer sized *at least* 255 + extra_bytes, then
   copying msg.len bytes from user.

 * Hardware + drivers wishing to support transfers > 32 bytes can then
   always rely on I2C_SMBUS30_BLOCK_MAX (255) bytes to be available.

   The above msg[i].len handling algo remains in place.
   The only thing changing is the buffer size guarantee alone.

 * On the return path from i2c_transfer(), a user-msg[i].len too small
   to contain the result might EFAULT.

   Unless a different errno seems seems better suited, to avoid
   ambiguities. EMSGSIZE?

   In any case, the philosophy would be that user msg lengths
   would be handled in i2c-core, not at all by drivers, beyond an option
   to adopt larger buffers.

 * For safety, either leave I2C_SMBUS_BLOCK_MAX at 32 by default,
   when building busses/*. Or
   initially substitute all uses with I2C_SMBUS20_BLOCK_MAX.

   I suppose it=E2=80=99s the latter, unless we avoid =
I2C_SMBUS20_BLOCK_MAX
   altogether, and stay with I2C_SMBUS_BLOCK_MAX=3D32 everywhere.
=20
The last point is because 32B-only capable drivers should avoid
breaking hardware semantics in some pathologic cases. Until they
get reviewed, each individually.

For example, if the slave supports large transfers, but the host adapter
never did, the driver shouldn=E2=80=99t use 255 here.
Or, same hardware limit, and reading a length prefix > 32 only owed to a
bit error due to line noise.

If the above sounds good enough to get started, I could volunteer to
make a prototype change. But I'd rather hear other opinions first.

>> Also, I suspect I=E2=80=99m not tellying anyone in this forum =
anything new.
>> Bear with me, I=E2=80=99ve made an attempt to find older discussions. =
But
>> didn=E2=80=99t see anything later than the exchange leading to the =
current
>> handling of I2C_M_RECV_LEN.
>=20
> As said above, there was none. However, your timing is not bad. I am
> currently devleoping a "testunit" driver for IP cores which can also =
be
> an I2C client themselves. It is already on the todo-list to add test
> cases for I2C_M_RECV_LEN there, too, so it can be tested independently
> of specific hardware. Of course, it is very good if there are people =
to
> validate the results with devices actually needing that!

Yes, I=E2=80=99d anticipate this should see a bunch of reviews from all =
kinds of people.
Kernel, user, etc.

As a first goal, we should find a point where anyone feels the most =
important
requirements are at least gathered.

Is i2c-tools maintaned by roughly the same folks reading linux-i2c?
Who else cares most, besides kernel clients?

Kind regards, and thanks a lot for your time!
Daniel

