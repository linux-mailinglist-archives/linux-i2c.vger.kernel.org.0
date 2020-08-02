Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46B0235A84
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Aug 2020 22:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgHBU2c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Aug 2020 16:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgHBU2c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Aug 2020 16:28:32 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1733AC06174A;
        Sun,  2 Aug 2020 13:28:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s15so7218420pgc.8;
        Sun, 02 Aug 2020 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0KQt0Q9yfUWh6Jb1UsLxbE9xMXEYisi/wAMb1qaTwpg=;
        b=crTuQWcmdZgVytzqCPLrodgD6o2MG7euv1myJoZMTF+9RszUqLlvm7CJrCuQVGYuEG
         v8qqjK8XR+pVYCtIQJYAx9SNGWbtpZ5dToVzQ1QlnBZMgXW1w7ZoLNQhjx4EQ2ssFFMQ
         PNazwDbHjMF0RA0vo1lCx30dKHE3J3zYw4N8Zc/o0CRp0LGdoNbe79ZrvQ6kTStQO7pv
         SpYtLoFMY5fNCoIwmYqgMZc1WXfn6y8vws79Toj+hmpa0ZMnOHR0VJHGa4edGjvGF28d
         9znfYjFLzwHxBbA4gN3/oVpdYMvVJV7IRDXBTTkwzH4EamvQES5ormUiIQqhKDt4SoB5
         YKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0KQt0Q9yfUWh6Jb1UsLxbE9xMXEYisi/wAMb1qaTwpg=;
        b=Midz83cDs467XWRTu+NF033CXgyOEgLYJewWYhjAiSEQFq+wblTq8DchBSrQbIKyZs
         sjuoYXy6+NeuPqvFrx87OsUZqI65d2TQSk6IiJ7wpoL4dXV0bXPWyVowy/NT6f9cRENv
         6WCClxk8s8cfzS8VOrI80kdve4Ykad4Mh2U3UcbMXZJBaWq2hVAkYjfWrnZW3jbPJ/if
         gl6V8fdlzfpiPxlJ4bIhMgRXJ3viSdqSVFkgbKeZrQZQBiELhDI9BdYv47BECLdOd7+S
         oqAKF30AMNeK6vtlM/hieCMqPgPkeASPPfeXp6y5vWW3E9Y1jVvNQ+NJ6SslIG6eSrCP
         r8Xg==
X-Gm-Message-State: AOAM532zY0KrJsLX+N2bhLM7ObtZIZYM8gBYzNeMq3YUAXclE/UWjduM
        SIVMf4FBr8Sz0ZvIKgeS4UA=
X-Google-Smtp-Source: ABdhPJzZ14BXH4PrXVeK2qUfVwkiMRLV+vqYnORWH6q3F4xsgv4G4OinW+tdDwSG7qIuVL0rHdAj8A==
X-Received: by 2002:a63:955c:: with SMTP id t28mr11864658pgn.18.1596400111506;
        Sun, 02 Aug 2020 13:28:31 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id b8sm1942362pfr.57.2020.08.02.13.28.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2020 13:28:30 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH i2c-tools] i2ctransfer: add support for I2C_M_RECV_LEN
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <20200802192842.13527-1-wsa+renesas@sang-engineering.com>
Date:   Sun, 2 Aug 2020 13:28:29 -0700
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C5EC2F45-41AD-465E-83F9-BDE3640B02AA@gmail.com>
References: <20200802192842.13527-1-wsa+renesas@sang-engineering.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Aug 2, 2020, at 12:28 PM, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>=20
> Strictly spoken, this is for emulating SMBus transfers, not I2C. But
> hey, we still want to test devices supporting these transfers.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> I created this to be able to play around with I2C_M_RECV_LEN and with
> SMBUS2 and SMBUS3 max block sizes. Tested with a Renesas Lager board =
and
> my slave-testunit hacked with SMBus block transfer support (to be
> upstreamed later).
>=20
> Fun fact: printing the correct length in the output took longer than
> implementing the actual functionality.
>=20
> tools/i2ctransfer.8 |  1 +
> tools/i2ctransfer.c | 42 +++++++++++++++++++++++++++++++-----------
> 2 files changed, 32 insertions(+), 11 deletions(-)
>=20
> diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
> index d16e34e..152d20d 100644
> --- a/tools/i2ctransfer.8
> +++ b/tools/i2ctransfer.8
> @@ -91,6 +91,7 @@ specifies if the message is read or write
> .B <length_of_message>
> specifies the number of bytes read or written in this message.
> It is parsed as an unsigned 16 bit integer, but note that the Linux =
Kernel applies an additional upper limit (8192 as of v4.10).
> +For read messages to targets which support SMBus Block transactions, =
it can also be '?', then the target will determine the length.
> .TP
> .B [@address]
> specifies the 7-bit address of the chip to be accessed for this =
message, and is an integer.
> diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
> index 7b95d48..2b8a3fb 100644
> --- a/tools/i2ctransfer.c
> +++ b/tools/i2ctransfer.c
> @@ -45,7 +45,8 @@ static void help(void)
> 		"Usage: i2ctransfer [-f] [-y] [-v] [-V] [-a] I2CBUS DESC =
[DATA] [DESC [DATA]]...\n"
> 		"  I2CBUS is an integer or an I2C bus name\n"
> 		"  DESC describes the transfer in the form: =
{r|w}LENGTH[@address]\n"
> -		"    1) read/write-flag 2) LENGTH (range 0-65535) 3) I2C =
address (use last one if omitted)\n"
> +		"    1) read/write-flag 2) LENGTH (range 0-65535, or =
'?')\n"
> +		"    3) I2C address (use last one if omitted)\n"
> 		"  DATA are LENGTH bytes for a write message. They can =
be shortened by a suffix:\n"
> 		"    =3D (keep value constant until LENGTH)\n"
> 		"    + (increase value by 1 until LENGTH)\n"
> @@ -84,17 +85,24 @@ static void print_msgs(struct i2c_msg *msgs, __u32 =
nmsgs, unsigned flags)
>=20
> 	for (i =3D 0; i < nmsgs; i++) {
> 		int read =3D msgs[i].flags & I2C_M_RD;
> +		int recv_len =3D msgs[i].flags & I2C_M_RECV_LEN;
> 		int print_buf =3D (read && (flags & PRINT_READ_BUF)) ||
> 				(!read && (flags & PRINT_WRITE_BUF));
> -
> -		if (flags & PRINT_HEADER)
> -			fprintf(output, "msg %u: addr 0x%02x, %s, len =
%u",
> -				i, msgs[i].addr, read ? "read" : =
"write", msgs[i].len);
> +		__u16 len =3D recv_len ? msgs[i].buf[0] + 1 : =
msgs[i].len;

This is post-ioctl()? (Sorry, still not familiar enough with i2c-tools.)

It isn=E2=80=99t wrong, but shouldn=E2=80=99t be necessary.
Unless the adapter driver you=E2=80=99re using went astray. Not ruling =
that out.

Before I2C_RDWR:
	- msg.len is sizeof(msg.buf)
	- msg.block[0] is <extra_bytes>

After I2C_RDWR:
	- msg.block[0] is <len> of transfer
	- msg.len is <len> + <extra_bytes> (but never > sizeof(msg.buf))

Hth,
Daniel

> +
> +		if (flags & PRINT_HEADER) {
> +			fprintf(output, "msg %u: addr 0x%02x, %s, len ",
> +				i, msgs[i].addr, read ? "read" : =
"write");
> +			if (!recv_len || flags & PRINT_READ_BUF)
> +				fprintf(output, "%u", len);
> +			else
> +				fprintf(output, "TBD");
> +		}
>=20
> 		if (msgs[i].len && print_buf) {
> 			if (flags & PRINT_HEADER)
> 				fprintf(output, ", buf ");
> -			for (j =3D 0; j < msgs[i].len - 1; j++)
> +			for (j =3D 0; j < len - 1; j++)
> 				fprintf(output, "0x%02x ", =
msgs[i].buf[j]);
> 			/* Print final byte with newline */
> 			fprintf(output, "0x%02x\n", msgs[i].buf[j]);
> @@ -192,13 +200,23 @@ int main(int argc, char *argv[])
> 				goto err_out_with_arg;
> 			}
>=20
> -			len =3D strtoul(arg_ptr, &end, 0);
> -			if (len > 0xffff || arg_ptr =3D=3D end) {
> -				fprintf(stderr, "Error: Length =
invalid\n");
> -				goto err_out_with_arg;
> +			if (*arg_ptr =3D=3D '?') {
> +				if (!(flags & I2C_M_RD)) {
> +					fprintf(stderr, "Error: variable =
length not allowed with write\n");
> +					goto err_out_with_arg;
> +				}
> +				len =3D 256; /* SMBUS3_MAX_BLOCK_LEN + 1 =
*/
> +				flags |=3D I2C_M_RECV_LEN;
> +				arg_ptr++;
> +			} else {
> +				len =3D strtoul(arg_ptr, &end, 0);
> +				if (len > 0xffff || arg_ptr =3D=3D end) =
{
> +					fprintf(stderr, "Error: Length =
invalid\n");
> +					goto err_out_with_arg;
> +				}
> +				arg_ptr =3D end;
> 			}
>=20
> -			arg_ptr =3D end;
> 			if (*arg_ptr) {
> 				if (*arg_ptr++ !=3D '@') {
> 					fprintf(stderr, "Error: Unknown =
separator after length\n");
> @@ -237,6 +255,8 @@ int main(int argc, char *argv[])
> 				}
> 				memset(buf, 0, len);
> 				msgs[nmsgs].buf =3D buf;
> +				if (flags & I2C_M_RECV_LEN)
> +					buf[0] =3D 1; /* number of extra =
bytes */
> 			}
>=20
> 			if (flags & I2C_M_RD || len =3D=3D 0) {
> --=20
> 2.27.0
>=20

