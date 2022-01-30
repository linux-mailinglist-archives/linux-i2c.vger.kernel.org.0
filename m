Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5700F4A3A90
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 22:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356860AbiA3VeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 16:34:02 -0500
Received: from wayoftao.net ([80.209.237.75]:57698 "EHLO mail.wayoftao.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356904AbiA3Vdq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 16:33:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EADA100800;
        Sun, 30 Jan 2022 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wayoftao.net;
        s=dkim; t=1643578424;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-language; bh=dQ0r1T4xej5bDgENcEzkk2nFTMyQWWSWxGyvybljUMA=;
        b=cfU7ezZTX5a08QzEOPVGGETNB2ryz1hB4gaNsSBK6qMkFaCTOk3Ige5zgi+l/qkFniPxbb
        oejm5+LYkV7LM61EOmiiFFXX7W937/TPR+JH9oJtKUhmLDEShoxYi/vFiy2z//2hjQ9Diq
        dDwvrKhJ57zFEOdpkm6MVZCECtv14VlhPdUt3WcCxLpB+rFaz8RtB3eFt/gq3HFYX6nVwL
        lHupeGYYm4c8gNX5hpjhhqfWTGio/rr1PDGlUIlZ1dQTsG5OvARFJK66sQFKRSDHo8SOD5
        Oe6JHmrPTtZMlAWN4DCjLkBYVGmbhArnJsnAH6HVyideKPZ0h02WeLccoMAJ0w==
Message-ID: <2cd98d51-f868-2bbb-f048-8096a13aa2f7@wayoftao.net>
Date:   Sun, 30 Jan 2022 22:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Kim Nilsson <kim@wayoftao.net>
Subject: Possible ACPI bug/regression in i2c-i801 [plain text]
To:     jdelvare@suse.com
Content-Language: en-US
Cc:     linux-i2c@vger.kernel.org
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GE02uWz56esgVyorUWsYxf0h"
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GE02uWz56esgVyorUWsYxf0h
Content-Type: multipart/mixed; boundary="------------2dHvCQAPQk83c4LoeMMMD44B";
 protected-headers="v1"
From: Kim Nilsson <kim@wayoftao.net>
To: jdelvare@suse.com
Cc: linux-i2c@vger.kernel.org
Message-ID: <2cd98d51-f868-2bbb-f048-8096a13aa2f7@wayoftao.net>
Subject: Possible ACPI bug/regression in i2c-i801 [plain text]

--------------2dHvCQAPQk83c4LoeMMMD44B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gbWFpbnRhaW5lcnMsDQoNCg0KSSd2ZSByZWNlbnRseSBiZWVuIGRvaW5nIHNvbWUg
c3VzcGVuZC9yZXN1bWUgdGVzdGluZyByZWxhdGVkIHRvIGFuIA0KczJpZGxlIGJ1ZyBpbiBh
bWRncHUgDQooaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvLS9pc3N1
ZXMvMTg3OSkgYW5kIEkndmUgY29tZSANCmFjcm9zcyBzb21lIHByb2JsZW1zIHdpdGggQy1z
dGF0ZXMuDQoNCkFmdGVyIHJlc3VtaW5nIGZyb20gczJpZGxlLCBQa2coSFcpIHdpbGwgbm8g
bG9uZ2VyIGVudGVyIGFueSBzdGF0ZSBDMiBvciANCmRlZXBlci4gU3VzcGVuZGluZyB0byBz
MyB3b3VsZCBub3QgdHJpZ2dlciB0aGlzIGlzc3VlIG9uIDUuMTYuMiwgYnV0IA0KYWZ0ZXIg
dHJ5aW5nIG91dCA1LjE2LjQgSSdtIGZhY2luZyBhIHNpbWlsYXIgcHJvYmxlbSB3aGVyZSBQ
a2coSFcpIHdpbGwgDQpyYXJlbHkgaWYgZXZlciBnbyBkZWVwZXIgdGhhbiBDMy4gTm93LCB0
aGUgcmVhc29uIEkgYW0gY29udGFjdGluZyB5b3UgaXMgDQpiZWNhdXNlIEkgd2FzIHBsYXlp
bmcgYXJvdW5kIHRvZGF5IGFuZCBmb3VuZCB0aGF0IHVubG9hZGluZyBpMmMtaTgwMSANCnNl
ZW1zIHRvIGZpeCB0aGUgaXNzdWUuDQoNCg0KIyBDUFU6IEludGVsKFIpIENvcmUoVE0pIGk3
LTg2NjVVIENQVSBAIDEuOTBHSHoNCiMgR1BVOiBJbnRlbCBDb3Jwb3JhdGlvbiBXaGlza2V5
TGFrZS1VIEdUMiBbVUhEIEdyYXBoaWNzIDYyMF0sIEFkdmFuY2VkIA0KTWljcm8gRGV2aWNl
cywgSW5jLiBbQU1EL0FUSV0gTGV4YSBYVCBbUmFkZW9uIFBSTyBXWCAzMTAwXQ0KIyAwMDox
NS4wIFNlcmlhbCBidXMgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gQ2Fubm9uIFBv
aW50LUxQIA0KU2VyaWFsIElPIEkyQyBDb250cm9sbGVyICMwIChyZXYgMzApDQojIDAwOjE1
LjEgU2VyaWFsIGJ1cyBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiBDYW5ub24gUG9p
bnQtTFAgDQpTZXJpYWwgSU8gSTJDIENvbnRyb2xsZXIgIzEgKHJldiAzMDA6MTkuMCBTZXJp
YWwgYnVzIGNvbnRyb2xsZXI6IEludGVsIA0KQ29ycG9yYXRpb24gQ2Fubm9uIFBvaW50LUxQ
IFNlcmlhbCBJTyBJMkMgSG9zdCBDb250cm9sbGVyIChyZXYgMzApDQoNCg0KZG1lc2cgb3V0
cHV0IHdoZW4gbG9hZGluZyB0aGUgbW9kdWxlIGFmdGVyIGFuIHVubG9hZDoNCg0KWyAxMDAy
Ljk2MTA5MV0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IFNQRCBXcml0ZSBEaXNhYmxlIGlz
IHNldA0KWyAxMDAyLjk2MTE3MV0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjQ6IFNNQnVzIHVz
aW5nIFBDSSBpbnRlcnJ1cHQNClsgMTAwMi45NjEzMjFdIGlUQ09fd2R0IGlUQ09fd2R0OiB1
bmFibGUgdG8gcmVzZXQgTk9fUkVCT09UIGZsYWcsIGRldmljZSANCmRpc2FibGVkIGJ5IGhh
cmR3YXJlL0JJT1MNClsgMTAwMi45NzUzOTldIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBB
Y2NlbGVyb21ldGVyIGxpczNsdjAyZCBpcyANCnByZXNlbnQgb24gU01CdXMgYnV0IGl0cyBh
ZGRyZXNzIGlzIHVua25vd24sIHNraXBwaW5nIHJlZ2lzdHJhdGlvbg0KWyAxMDAyLjk3NTQw
Nl0gaTJjIGkyYy0xMDogMi8yIG1lbW9yeSBzbG90cyBwb3B1bGF0ZWQgKGZyb20gRE1JKQ0K
WyAxMDAyLjk3NjcxM10gZWUxMDA0IDEwLTAwNTA6IDUxMiBieXRlIEVFMTAwNC1jb21wbGlh
bnQgU1BEIEVFUFJPTSwgDQpyZWFkLW9ubHkNClsgMTAwMi45NzY4MDhdIGkyYyBpMmMtMTA6
IFN1Y2Nlc3NmdWxseSBpbnN0YW50aWF0ZWQgU1BEIGF0IDB4NTANCg0KDQpUaGlzIGlzIG15
IGZpcnN0IExLTUwgYnVnIHJlcG9ydCwgc28gSSBjb3VsZCB1c2Ugc29tZSBndWlkYW5jZSBp
biBob3cgdG8gDQpwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24uDQoNCg0KUmVnYXJkcywNCg0K
S2ltIE5pbHNzb24NCg0KDQpQUy4gU29ycnkgYWJvdXQgdGhlIGluaXRpYWwgSFRNTCB2ZXJz
aW9uIQ0KDQoNCg0K

--------------2dHvCQAPQk83c4LoeMMMD44B--

--------------GE02uWz56esgVyorUWsYxf0h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEVGq84EJQRtWonhiWfwaiOxiOwqIFAmH3BDcFAwAAAAAACgkQfwaiOxiOwqJy
lA//fkn1zaGVR+BM9WWY2Oc186JINQK+JnkDIWuS2vV6nnjJeDVthK25pqrWzRIpKygX5B2JKnu2
DiDsqX957ct36qjQcFvs+tN12V8xhqTvG1FADQ925MHkgPB1mDcnt9Lu3f3ut6uBYAUXoCoujCNK
qSs8KL/6ZdnAwi7gLqm9H2XZcWhtmucD9PI9zEZm0oW3XL/BSSfDCiaowVTt/ymEkeek+gSjV6mF
ZfTDtMOihobZ61P2vdb9Amv7p+EYed8WXisCDNxylfwFmzetPJ8C/FzoKDKPu/XapQuyYPmWAYr6
ona1WS/vsHgQAKloai2vXOG0PR41wx+7ViejIn/UFy6amE5W6skwmMayRRWBXOeDcKx4VZQrpKD2
uHUmuqtK+AQUq7b4/iopglmla8N1Ob0plVLOT3sMz5ByInAMLggTD9bZIsH9jbro6hmrd7aHRdeC
0TcMb3IfGvTwWhpGgdwnddXLHRxNE1JRkSU0GbKtKQvtbr1zpRpmjTYlRnUMVdhfej4lH8Ws+ns8
V+599uP113Umlzv+6dA18XI3h4+nozmyhXIVGH0NhrDcqtWEpPmDPhLMQBuqWAfdxFgG4NqezUv7
zRsPjyrXEF6ohdOANnlcAKHRoNEZD5eHQeCARyEuKiuuBIJzPm3hMN3tudQrFgT548UoVfPYnWUw
+TE=
=zaJK
-----END PGP SIGNATURE-----

--------------GE02uWz56esgVyorUWsYxf0h--
